import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:praca_inzynierska_api/praca_inzynierska_api.dart';

class RatingsPage extends StatefulWidget {
  final Dio dio;
  final String gameId;

  const RatingsPage({super.key, required this.dio, required this.gameId});

  @override
  State<RatingsPage> createState() => _RatingsPageState();
}

class _RatingsPageState extends State<RatingsPage> {
  BuiltList<GameRating>? _ratings;
  bool _isLoading = true;
  String? _errorMessage;
  int _currentPage = 0;
  final int _pageSize = 10;
  bool _hasMore = true;
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _contentController = TextEditingController();
  int _ratingValue = 5;
  String _selectedSort = 'createdAt_desc';

  @override
  void initState() {
    super.initState();
    _fetchRatings();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200 &&
        !_isLoading &&
        _hasMore) {
      _currentPage++;
      _fetchRatings();
    }
  }

  Future<void> _fetchRatings() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final gameRatingsApi = GameRatingsApi(widget.dio, standardSerializers);
      final response = await gameRatingsApi.getGameRatings(
        gameId: widget.gameId,
        page: _currentPage,
        size: _pageSize,
        sort: _selectedSort,
      );

      setState(() {
        final newRatings = response.data ?? BuiltList<GameRating>();
        if (_ratings == null) {
          _ratings = newRatings;
        } else {
          _ratings = _ratings!.rebuild((b) => b.addAll(newRatings));
        }
        _hasMore = newRatings.isNotEmpty;
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Błąd podczas pobierania recenzji: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _addRating() async {
    final content = _contentController.text.trim();

    if (content.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Treść recenzji nie może być pusta')));
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final gameRatingsApi = GameRatingsApi(widget.dio, standardSerializers);
      final createRating = CreateGameRating((b) => b
        ..rating = _ratingValue
        ..content = content);

      await gameRatingsApi.createGameRating(
        gameId: widget.gameId,
        createGameRating: createRating,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Recenzja została dodana')),
      );

      _contentController.clear();
      _ratingValue = 5;

      _ratings = null;
      _currentPage = 0;
      _hasMore = true;
      _fetchRatings();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Błąd podczas dodawania recenzji: $e')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _voteOnRating(String ratingId, bool isUpvote) async {
    try {
      final vote = Vote((b) => b
        ..voteType = isUpvote ? 'UP' : 'DOWN');

      final voteApi = VotesApi(widget.dio, standardSerializers);
      await voteApi.voteOnGameRating(
        ratingId: ratingId,
        vote: vote,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(isUpvote ? 'Głos dodany 👍' : 'Głos dodany 👎')),
      );

      setState(() {
        _ratings = null;
        _currentPage = 0;
        _hasMore = true;
      });
      await _fetchRatings();
    } on DioError catch (e) {
      if (e.response?.statusCode == 409) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Już głosowałeś na tę recenzję!')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Błąd podczas głosowania: ${e.response?.data['error'] ?? e.message}')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Nieoczekiwany błąd: $e')),
      );
    }
  }

  Future<void> _voteOnComment(String commentId, bool isUpvote) async {
    try {
      final vote = Vote((b) => b
        ..voteType = isUpvote ? 'UP' : 'DOWN');

      final voteApi = VotesApi(widget.dio, standardSerializers);
      await voteApi.voteOnGameRatingAnswer(
        answerId: commentId,
        vote: vote,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(isUpvote ? 'Głos dodany 👍' : 'Głos dodany 👎')),
      );

      setState(() {
        _ratings = null;
        _currentPage = 0;
        _hasMore = true;
      });
      await _fetchRatings();
    } on DioError catch (e) {
      if (e.response?.statusCode == 409) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Już głosowałeś na ten komentarz!')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Błąd podczas głosowania: ${e.response?.data['error'] ?? e.message}')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Nieoczekiwany błąd: $e')),
      );
    }
  }

  Future<void> _addComment(String ratingId, String content) async {
    if (content.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Treść komentarza nie może być pusta')),
      );
      return;
    }

    try {
      final gameRatingAnswersApi = GameRatingAnswersApi(widget.dio, standardSerializers);
      final createComment = CreateGameRatingAnswer((b) => b..content = content);

      await gameRatingAnswersApi.createGameRatingAnswer(
        ratingId: ratingId,
        createGameRatingAnswer: createComment,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Komentarz został dodany')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Błąd podczas dodawania komentarza: $e')),
      );
    }
  }

  Future<BuiltList<GameRatingAnswer>> _fetchComments(String ratingId) async {
    try {
      final gameRatingAnswersApi = GameRatingAnswersApi(widget.dio, standardSerializers);
      final response = await gameRatingAnswersApi.getGameRatingAnswers(ratingId: ratingId);
      return response.data ?? BuiltList<GameRatingAnswer>();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Błąd podczas pobierania komentarzy: $e')),
      );
      return BuiltList();
    }
  }

  /*Future<void> _voteOnComment(String commentId, bool isUpvote) async {
    try {
      final gameRatingAnswersApi = GameRatingAnswersApi(widget.dio, standardSerializers);
      final voteRequest = VoteRequest((b) => b
        ..voteType = isUpvote ? VoteRequestVoteTypeEnum.UP : VoteRequestVoteTypeEnum.DOWN);

      await gameRatingAnswersApi.voteOnGameRatingAnswer(
        voteRequest: voteRequest,
        answerId: commentId,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(isUpvote ? 'Głos dodany 👍' : 'Głos dodany 👎')),
      );

      // Odśwież dane recenzji i komentarzy
      setState(() {
        _ratings = null;
        _currentPage = 0;
        _hasMore = true;
      });
      await _fetchRatings();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Błąd podczas głosowania: $e')),
      );
    }
  }*/

  Future<VoteCount> _fetchVotesForRating(String ratingId) async {
    try {
      final voteApi = VotesApi(widget.dio, standardSerializers);
      final response = await voteApi.getVotesForGameRating(ratingId: ratingId);
      return response.data ?? VoteCount((b) => b
        ..upvotes = 0
        ..downvotes = 0);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Błąd podczas pobierania głosów dla recenzji: $e')),
      );
      return VoteCount((b) => b
        ..upvotes = 0
        ..downvotes = 0);
    }
  }

  Future<VoteCount> _fetchVotesForAnswer(String answerId) async {
    try {
      final voteApi = VotesApi(widget.dio, standardSerializers);
      final response = await voteApi.getVotesForGameRatingAnswer(answerId: answerId);
      return response.data ?? VoteCount((b) => b
        ..upvotes = 0
        ..downvotes = 0);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Błąd podczas pobierania głosów dla odpowiedzi: $e')),
      );
      return VoteCount((b) => b
        ..upvotes = 0
        ..downvotes = 0);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recenzje gry'),
      ),
      body: Column(
        children: [
          _buildSortDropdown(),
          _buildAddRatingForm(),
          Expanded(
            child: _isLoading && (_ratings == null || _ratings!.isEmpty)
                ? const Center(child: CircularProgressIndicator())
                : _errorMessage != null
                ? Center(child: Text(_errorMessage!))
                : _buildRatingsList(_ratings!),
          ),
        ],
      ),
    );
  }

  Widget _buildAddRatingForm() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Dodaj swoją recenzję',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Text('Ocena:'),
              const SizedBox(width: 8),
              DropdownButton<int>(
                value: _ratingValue,
                items: List.generate(10, (index) => index + 1)
                    .map((value) => DropdownMenuItem(
                  value: value,
                  child: Text('$value/10'),
                ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _ratingValue = value!;
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _contentController,
            maxLines: 3,
            decoration: const InputDecoration(
              labelText: 'Treść recenzji',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              onPressed: _addRating,
              child: const Text('Dodaj recenzję'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRatingsList(BuiltList<GameRating> ratings) {
    return ListView.builder(
      controller: _scrollController,
      itemCount: ratings.length,
      itemBuilder: (context, index) {
        final rating = ratings[index];
        return FutureBuilder<VoteCount>(
          future: _fetchVotesForRating(rating.id!),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text('Błąd: ${snapshot.error}');
            } else {
              final votes = snapshot.data!;
              return ExpansionTile(
                title: Text(rating.content ?? 'Brak treści'),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Ocena: ${rating.rating}/10'),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.thumb_up, color: Colors.green),
                          onPressed: () => _voteOnRating(rating.id!, true),
                        ),
                        Text('${votes.upvotes}'),
                        IconButton(
                          icon: const Icon(Icons.thumb_down, color: Colors.red),
                          onPressed: () => _voteOnRating(rating.id!, false),
                        ),
                        Text('${votes.downvotes}'),
                      ],
                    ),
                  ],
                ),
                children: [
                  FutureBuilder<BuiltList<GameRatingAnswer>>(
                    future: _fetchComments(rating.id!),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Text('Błąd: ${snapshot.error}');
                      } else {
                        final comments = snapshot.data ?? BuiltList();
                        return Column(
                          children: comments.map((comment) {
                            return FutureBuilder<VoteCount>(
                              future: _fetchVotesForAnswer(comment.id!),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState == ConnectionState.waiting) {
                                  return const Center(child: CircularProgressIndicator());
                                } else if (snapshot.hasError) {
                                  return Text('Błąd: ${snapshot.error}');
                                } else {
                                  final votes = snapshot.data!;
                                  return ListTile(
                                    title: Text(comment.content ?? 'Brak treści'),
                                    subtitle: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            IconButton(
                                              icon: const Icon(Icons.thumb_up, color: Colors.green),
                                              onPressed: () =>
                                                  _voteOnComment(comment.id!, true),
                                            ),
                                            Text('${votes.upvotes}'),
                                            IconButton(
                                              icon: const Icon(Icons.thumb_down, color: Colors.red),
                                              onPressed: () =>
                                                  _voteOnComment(comment.id!, false),
                                            ),
                                            Text('${votes.downvotes}'),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                }
                              },
                            );
                          }).toList(),
                        );
                      }
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: const InputDecoration(
                        labelText: 'Dodaj komentarz',
                        border: OutlineInputBorder(),
                      ),
                      onSubmitted: (content) => _addComment(rating.id!, content),
                    ),
                  ),
                ],
              );
            }
          },
        );
      },
    );
  }



  Widget _buildSortDropdown() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          const Text('Sortuj według:'),
          const SizedBox(width: 8),
          DropdownButton<String>(
            value: _selectedSort,
            items: const [
              DropdownMenuItem(value: 'createdAt_desc', child: Text('Najnowsze')),
              DropdownMenuItem(value: 'createdAt_asc', child: Text('Najstarsze')),
              DropdownMenuItem(value: 'votesUp_desc', child: Text('Najwięcej głosów 👍')),
              DropdownMenuItem(value: 'votesUp_asc', child: Text('Najmniej głosów 👍')),
              DropdownMenuItem(value: 'votesDown_desc', child: Text('Najwięcej głosów 👎')),
              DropdownMenuItem(value: 'votesDown_asc', child: Text('Najmniej głosów 👎')),
            ],
            onChanged: (value) {
              setState(() {
                _selectedSort = value!;
                _ratings = null;
                _currentPage = 0;
                _hasMore = true;
                _fetchRatings();
              });
            },
          ),
        ],
      ),
    );
  }
}
