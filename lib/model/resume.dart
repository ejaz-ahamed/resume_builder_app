import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:resume_builder_app/model/resume_section.dart';

part 'resume.freezed.dart';
part 'resume.g.dart';

@freezed
class ResumeModel with _$ResumeModel {
  factory ResumeModel({
    required List<ResumeSection> sections,
    required String name,
  }) = _ResumeModel;

  factory ResumeModel.fromJson(Map<String, Object?> json) =>
      _$ResumeModelFromJson(json);
}
