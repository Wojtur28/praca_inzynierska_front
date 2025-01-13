import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:praca_inzynierska_api/praca_inzynierska_api.dart';

import '../../data/auth_storage.dart';

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
  String? _currentUserId;

  @override
  void initState() {
    super.initState();
    _initializeUser();
    _fetchRatings();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  Future<void> _initializeUser() async {
    final authStorage = AuthStorage();
    final token = await authStorage.getToken();

    if (token != null) {
      _currentUserId = _extractUserIdFromToken(token);
      print('Extracted User ID: $_currentUserId');
    } else {
      print('No token found');
    }
  }

  String? _extractUserIdFromToken(String jwt) {
    try {
      final parts = jwt.split('.');
      if (parts.length != 3) return null;

      final payload = parts[1];
      final decoded = utf8.decode(base64Url.decode(base64Url.normalize(payload)));
      final json = jsonDecode(decoded);

      print('Decoded JWT Payload: $json');
      return json['userId'];
    } catch (e) {
      print('Error extracting userId from token: $e');
      return null;
    }
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

      _ratings = BuiltList<GameRating>();
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
        _ratings = BuiltList<GameRating>();
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
        _ratings = BuiltList<GameRating>();
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

      setState(() {});
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

  Future<void> _deleteRating(String gameId, String ratingId) async {
    try {
      final gameRatingsApi = GameRatingsApi(widget.dio, standardSerializers);
      await gameRatingsApi.deleteGameRating(
        gameId: gameId,
        ratingId: ratingId,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Recenzja została usunięta')),
      );

      setState(() {
        _ratings = BuiltList<GameRating>();
        _currentPage = 0;
        _hasMore = true;
      });
      await _fetchRatings();
    } on DioError catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Błąd podczas usuwania recenzji: ${e.response?.data['error'] ?? e.message}')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Nieoczekiwany błąd: $e')),
      );
    }
  }

  Future<void> _deleteComment(String ratingId, String commentId) async {
    try {
      final gameRatingAnswersApi = GameRatingAnswersApi(widget.dio, standardSerializers);
      await gameRatingAnswersApi.deleteGameRatingAnswer(
        ratingId: ratingId,
        answerId: commentId,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Komentarz został usunięty')),
      );

      setState(() {});
    } on DioError catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Błąd podczas usuwania komentarza: ${e.response?.data['error'] ?? e.message}')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Nieoczekiwany błąd: $e')),
      );
    }
  }


  Future<void> _updateGameRating(String gameId, String ratingId, GameRating updatedRating) async {
    try {
      final gameRatingsApi = GameRatingsApi(widget.dio, standardSerializers);
      await gameRatingsApi.updateGameRating(
        gameId: gameId,
        ratingId: ratingId,
        gameRating: updatedRating,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Recenzja została zaktualizowana')),
      );

      setState(() {
        _ratings = BuiltList<GameRating>();
        _currentPage = 0;
        _hasMore = true;
      });
      await _fetchRatings();
    } on DioError catch (e) {
      if (e.response?.statusCode == 403) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Nie możesz edytować recenzji innego użytkownika')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Błąd podczas aktualizacji recenzji: ${e.response?.data['error'] ?? e.message}')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Nieoczekiwany błąd: $e')),
      );
    }
  }

  Future<void> _updateGameRatingAnswer(String ratingId, String answerId, GameRatingAnswer updatedAnswer) async {
    try {
      final gameRatingAnswersApi = GameRatingAnswersApi(widget.dio, standardSerializers);
      await gameRatingAnswersApi.updateGameRatingAnswer(
        ratingId: ratingId,
        answerId: answerId,
        gameRatingAnswer: updatedAnswer,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Odpowiedź została zaktualizowana')),
      );

      setState(() {
        _ratings = BuiltList<GameRating>();
        _currentPage = 0;
        _hasMore = true;
      });
      await _fetchRatings();
    } on DioError catch (e) {
      if (e.response?.statusCode == 403) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Nie możesz edytować odpowiedzi innego użytkownika')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Błąd podczas aktualizacji odpowiedzi: ${e.response?.data['error'] ?? e.message}')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Nieoczekiwany błąd: $e')),
      );
    }
  }

  Future<String?> _showEditDialog(BuildContext context, String initialContent) async {
    final controller = TextEditingController(text: initialContent);

    return showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edytuj treść'),
          content: TextField(
            controller: controller,
            maxLines: 3,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, null),
              child: const Text('Anuluj'),
            ),
            TextButton(
              onPressed: () {
                final content = controller.text.trim();
                if (content.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Treść nie może być pusta')),
                  );
                } else {
                  Navigator.pop(context, content);
                }
              },
              child: const Text('Zapisz'),
            ),
          ],
        );
      },
    );
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
    if (ratings.isEmpty) {
      return const Center(child: Text('Brak recenzji do wyświetlenia'));
    }
    return ListView.builder(
      controller: _scrollController,
      itemCount: ratings.length,
      itemBuilder: (context, index) {
        final rating = ratings[index];
        final isOwner = rating.user?.id == _currentUserId;

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
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Ocena: ${rating.rating}/10'),
                    Text('Autor: ${rating.user?.email ?? "Nieznany"}'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            if (isOwner)
                              Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.edit, color: Colors.blue),
                                    onPressed: () async {
                                      final updatedContent = await _showEditDialog(context, rating.content ?? '');
                                      if (updatedContent != null) {
                                        final updatedRating = rating.rebuild((b) => b..content = updatedContent);
                                        await _updateGameRating(widget.gameId, rating.id!, updatedRating);
                                      }
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.delete, color: Colors.red),
                                    onPressed: () => _deleteRating(widget.gameId, rating.id!),
                                  ),
                                ],
                              ),
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
                            final isCommentOwner = comment.createdBy == _currentUserId;

                            return ListTile(
                              title: Text(comment.content ?? 'Brak treści'),
                              subtitle: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      if (isCommentOwner)
                                        Row(
                                          children: [
                                            IconButton(
                                              icon: const Icon(Icons.edit, color: Colors.blue),
                                              onPressed: () async {
                                                final updatedContent = await _showEditDialog(context, comment.content ?? '');
                                                if (updatedContent != null) {
                                                  final updatedAnswer = comment.rebuild((b) => b..content = updatedContent);
                                                  await _updateGameRatingAnswer(rating.id!, comment.id!, updatedAnswer);
                                                }
                                              },
                                            ),
                                            IconButton(
                                              icon: const Icon(Icons.delete, color: Colors.red),
                                              onPressed: () => _deleteComment(rating.id!, comment.id!),
                                            ),
                                          ],
                                        ),
                                      IconButton(
                                        icon: const Icon(Icons.thumb_up, color: Colors.green),
                                        onPressed: () => _voteOnComment(comment.id!, true),
                                      ),
                                      Text('${votes.upvotes}'),
                                      IconButton(
                                        icon: const Icon(Icons.thumb_down, color: Colors.red),
                                        onPressed: () => _voteOnComment(comment.id!, false),
                                      ),
                                      Text('${votes.downvotes}'),
                                    ],
                                  ),
                                ],
                              ),
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



  Widget _buildComments(GameRating rating) {
    return FutureBuilder<BuiltList<GameRatingAnswer>>(
      future: _fetchComments(rating.id!),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Błąd: ${snapshot.error}');
        } else {
          final comments = snapshot.data ?? BuiltList();
          return Column(
            children: [
              ...comments.map((comment) {
                final isCommentOwner = comment.createdBy == _currentUserId;

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
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Autor: ${comment.user?.email ?? "Nieznany"}'),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    if (isCommentOwner)
                                      IconButton(
                                        icon: const Icon(Icons.edit, color: Colors.blue),
                                        onPressed: () async {
                                          final updatedContent =
                                          await _showEditDialog(context, comment.content ?? '');
                                          if (updatedContent != null) {
                                            final updatedAnswer =
                                            comment.rebuild((b) => b..content = updatedContent);
                                            await _updateGameRatingAnswer(
                                                rating.id!, comment.id!, updatedAnswer);
                                          }
                                        },
                                      ),
                                    IconButton(
                                      icon: const Icon(Icons.thumb_up, color: Colors.green),
                                      onPressed: () => _voteOnComment(comment.id!, true),
                                    ),
                                    Text('${votes.upvotes}'),
                                    IconButton(
                                      icon: const Icon(Icons.thumb_down, color: Colors.red),
                                      onPressed: () => _voteOnComment(comment.id!, false),
                                    ),
                                    Text('${votes.downvotes}'),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }
                  },
                );
              }).toList(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: const InputDecoration(
                          labelText: 'Dodaj komentarz',
                          border: OutlineInputBorder(),
                        ),
                        onSubmitted: (content) => _addComment(rating.id!, content),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.send, color: Colors.blue),
                      onPressed: () {
                        final content = _contentController.text.trim();
                        if (content.isNotEmpty) {
                          _addComment(rating.id!, content);
                          _contentController.clear();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          );
        }
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
                _ratings = BuiltList<GameRating>();
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
