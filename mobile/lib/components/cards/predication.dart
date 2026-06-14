import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mobile/components/custom_widgets/option_win.dart';
import 'package:mobile/components/widgets.dart';
import 'package:mobile/constants/styles.dart';

enum TypePredicationEnum {
  exact('EXACT_SCORE'),
  result('MATCH_RESULT'),
  nulled('NULLED');

  final String value;
  const TypePredicationEnum(this.value);
}

enum MatchStatus {
  upcoming('SCHEDULED'),
  live('IN_PROGRESS'),
  finished('FINISHED');

  final String value;
  const MatchStatus(this.value);
}

enum ResultGuessEnum {
  homeWin('HOME_WIN'),
  draw('DRAW'),
  awayWin('AWAY_WIN'),
  nulled('NULLED');

  final String value;
  const ResultGuessEnum(this.value);
}

class Predication extends StatefulWidget {
  final String? time;
  final String match;
  final MatchStatus matchStatus;
  final TypePredicationEnum type;
  final String? homeTeam;
  final int? homeScore;
  final int? homeScorePrediction;
  final String? awayTeam;
  final int? awayScore;
  final int? awayScorePrediction;
  final ResultGuessEnum resultGuess;
  final bool isOpined;
  final Widget? opined;
  final Future<void> Function(ResultGuessEnum? result, int? homeScore, int? awayScore)? onOpinar;

  const Predication({
    super.key,
    required this.time,
    required this.match,
    required this.matchStatus,
    required this.type,
    this.homeTeam,
    this.awayTeam,
    this.onOpinar,
    this.homeScore,
    this.awayScore,
    this.homeScorePrediction,
    this.awayScorePrediction,
    required this.resultGuess,
    this.isOpined = false,
    this.opined,
  });

  @override
  State<Predication> createState() => _PredicationState();
}

class _PredicationState extends State<Predication> {
  String? _errorText;
  bool _isLoading = false;
  late ResultGuessEnum _selectedResult;
  late TextEditingController _homeScoreController;
  late TextEditingController _awayScoreController;

  @override
  void initState() {
    super.initState();
    _selectedResult = widget.resultGuess;
    _homeScoreController = TextEditingController(text: widget.homeScorePrediction?.toString() ?? '');
    _awayScoreController = TextEditingController(text: widget.awayScorePrediction?.toString() ?? '');
  }

  @override
  void didUpdateWidget(Predication oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.resultGuess != oldWidget.resultGuess) {
      _selectedResult = widget.resultGuess;
    }
    if (widget.homeScorePrediction != oldWidget.homeScorePrediction) {
      _homeScoreController.text = widget.homeScorePrediction?.toString() ?? '';
    }
    if (widget.awayScorePrediction != oldWidget.awayScorePrediction) {
      _awayScoreController.text = widget.awayScorePrediction?.toString() ?? '';
    }
  }

  @override
  void dispose() {
    _homeScoreController.dispose();
    _awayScoreController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        color: AppColors.bgSecondary,
        borderRadius: BorderRadius.circular(4),
        border: Border(
          bottom: BorderSide(
            width: 3, 
            color: widget.matchStatus != MatchStatus.finished 
                ? AppColors.yellowPrimary 
                : getColor(widget.type),
          ),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (widget.time != null) ...[
            Text(widget.time!, style: AppFonts.time),
            const SizedBox(height: 12),
          ],
          Text(widget.match, style: AppFonts.titleSmall),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/teams/${widget.homeTeam ?? 'placeholder'}.png', width: 48, height: 48),
              const SizedBox(width: 12),
              Text('${widget.homeScore ?? ''}', style: AppFonts.titleMedium),
              const SizedBox(width: 12),
              Icon(LucideIcons.x, size: 24, color: AppColors.textMuted),
              const SizedBox(width: 12),
              Text('${widget.awayScore ?? ''}', style: AppFonts.titleMedium),
              const SizedBox(width: 12),
              Image.asset('assets/teams/${widget.awayTeam ?? 'placeholder'}.png', width: 48, height: 48),
            ],
          ),
          const SizedBox(height: 8),
          widget.type == TypePredicationEnum.result
              ? CustomDivider(text: 'Quem você acha que vence?')
              : CustomDivider(text: 'Qual o placar?'),
          const SizedBox(height: 8),
          widget.type == TypePredicationEnum.result
            ? Row(
              children: [
                Expanded(
                  flex: 1,
                  child: OptionWin(
                    team: widget.homeTeam ?? 'Mandante',
                    value: _selectedResult == ResultGuessEnum.homeWin,
                    onChanged: (value) {
                      setState(() {
                        _selectedResult = _selectedResult == ResultGuessEnum.homeWin
                            ? ResultGuessEnum.nulled
                            : ResultGuessEnum.homeWin;
                        _errorText = null;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  flex: 2,
                  child: OptionWin(
                    value: _selectedResult == ResultGuessEnum.draw,
                    onChanged: (value) {
                      setState(() {
                        _selectedResult = _selectedResult == ResultGuessEnum.draw
                            ? ResultGuessEnum.nulled
                            : ResultGuessEnum.draw;
                        _errorText = null;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  flex: 1,
                  child: OptionWin(
                    team: widget.awayTeam ?? 'Visitante',
                    value: _selectedResult == ResultGuessEnum.awayWin,
                    onChanged: (value) {
                      setState(() {
                        _selectedResult = _selectedResult == ResultGuessEnum.awayWin
                            ? ResultGuessEnum.nulled
                            : ResultGuessEnum.awayWin;
                        _errorText = null;
                      });
                    },
                  ),
                ),
              ],
            )
            : Row(
              children: [
                Expanded(
                  child: OptionScore(
                    team: widget.homeTeam ?? 'Mandante',
                    controller: _homeScoreController,
                  ),
                ),
                const SizedBox(width: 48),
                Icon(LucideIcons.x, size: 24, color: AppColors.textMuted),
                const SizedBox(width: 48),
                Expanded(
                  child: OptionScore(
                    team: widget.awayTeam ?? 'Visitante',
                    controller: _awayScoreController,
                    left: true,
                  ),
                ),
              ],
            ),
          if (_errorText != null) ...[
            const SizedBox(height: 8),
            Text(
              _errorText!,
              style: AppFonts.caption.copyWith(color: AppColors.textError),
            ),
          ],
          const SizedBox(height: 16),
          TertiaryButton(
            icon: widget.isOpined ? LucideIcons.checkCheck : LucideIcons.check,
            text: widget.isOpined ? 'JÁ PALPITADO' : 'CONFIRMAR PALPITE',
            isLoading: _isLoading,
            onPressed: widget.isOpined || _isLoading
                ? null
                : () async {
                    if (widget.type == TypePredicationEnum.result && _selectedResult == ResultGuessEnum.nulled) {
                      setState(() {
                        _errorText = 'selecione alguma opção';
                      });
                    } else if (widget.type == TypePredicationEnum.exact && (_homeScoreController.text.isEmpty || _awayScoreController.text.isEmpty)) {
                      setState(() {
                        _errorText = 'preencha os placares';
                      });
                    } else {
                      setState(() {
                        _errorText = null;
                        _isLoading = true;
                      });
                      final homeScore = int.tryParse(_homeScoreController.text);
                      final awayScore = int.tryParse(_awayScoreController.text);
                      await widget.onOpinar?.call(
                        widget.type == TypePredicationEnum.result ? _selectedResult : null,
                        widget.type == TypePredicationEnum.exact ? homeScore : null,
                        widget.type == TypePredicationEnum.exact ? awayScore : null,
                      );
                      if (mounted) {
                        setState(() {
                          _isLoading = false;
                        });
                      }
                    }
                  },
          ),
        ],
      ),
    );
  }

  Color getColor(TypePredicationEnum type) {
    if (type == TypePredicationEnum.exact) {
      if (widget.homeScorePrediction == widget.homeScore && widget.awayScorePrediction == widget.awayScore) {
        return AppColors.greenPrimary;
      }
      return AppColors.textError;
    }

    if (widget.homeScore != null && widget.awayScore != null) {
      if (widget.homeScore! > widget.awayScore! && widget.resultGuess == ResultGuessEnum.homeWin) {
        return AppColors.greenPrimary;
      }

      if (widget.homeScore! < widget.awayScore! && widget.resultGuess == ResultGuessEnum.awayWin) {
        return AppColors.greenPrimary;
      }

      if (widget.homeScore! == widget.awayScore! && widget.resultGuess == ResultGuessEnum.draw) {
        return AppColors.greenPrimary;
      }
    }

    return AppColors.textError;
  }
}