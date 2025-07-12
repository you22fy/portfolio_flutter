import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:you22fy/app_view_model.dart';
import 'package:you22fy/sections/articles.dart';
import 'package:you22fy/sections/background.dart';
import 'package:you22fy/sections/profile.dart';
import 'package:you22fy/sections/qualification.dart';
import 'package:you22fy/sections/research.dart';
import 'package:you22fy/sections/skill.dart';
import 'package:you22fy/sections/works.dart';

class AppBody extends StatelessWidget {
  const AppBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(builder: (context, viewModel, child) {
      if (viewModel.isLoading) {
        return const Center(child: CircularProgressIndicator());
      }
      if (viewModel.errorMessage != null) {
        return Center(child: Text(viewModel.errorMessage!));
      }
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
          child: Column(
            spacing: 32,
            children: [
              const ProfileSection(),
              ResearchSection(
                researches: viewModel.staticInfo?.researches ?? [],
              ),
              BackgroundSection(
                workHistories: viewModel.staticInfo?.workHistories ?? [],
              ),
              const SkillSection(),
              WorksSection(),
              QualificationSection(
                qualifications: viewModel.staticInfo?.qualifications ?? [],
              ),
              ArticlesSection(articles: viewModel.qiitaArticles ?? []),
            ],
          ),
        ),
      );
    });
  }
}
