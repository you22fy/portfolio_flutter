import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:you22fy/components/section_builder.dart';
import 'package:you22fy/gen/assets.gen.dart';

enum ProfileImage { character, me }

class ProfileSection extends StatefulWidget {
  const ProfileSection({super.key});

  @override
  State<ProfileSection> createState() => _ProfileSectionState();
}

class _ProfileSectionState extends State<ProfileSection> {
  ProfileImage profileImage = ProfileImage.character;

  @override
  void initState() {
    super.initState();
    profileImage = ProfileImage.character;
  }

  void toggleProfileImage() {
    setState(() {
      profileImage = profileImage == ProfileImage.character
          ? ProfileImage.me
          : ProfileImage.character;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SectionBuilder(
      title: 'プロフィール',
      builder: (context) {
        return Row(
          children: [
            // プロフィール画像
            Stack(
              clipBehavior: Clip.none,
              children: [
                CircleAvatar(
                  radius: 52,
                  backgroundColor: theme.colorScheme.secondary,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: CachedNetworkImageProvider(
                      profileImage == ProfileImage.character
                          ? Assets.images.iconCharacter.path
                          : Assets.images.iconMe.path,
                    ),
                  ),
                ),
                Positioned(
                  right: -12,
                  bottom: -12,
                  child: IconButton(
                    onPressed: toggleProfileImage,
                    icon: Icon(
                      Icons.change_circle_sharp,
                      size: 32,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 32),
            // 自己紹介文
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '藤田優希',
                    style: theme.textTheme.headlineMedium,
                  ),
                  Text(
                    '福岡大学大学院\n工学研究科電子情報工学専攻 M1',
                    style: theme.textTheme.bodyMedium,
                  ),
                  const Divider(),
                  Text(
                    '研究室では自然言語処理システムを研究。',
                    style: theme.textTheme.bodySmall,
                  ),
                  Text(
                    '学部1年次から複数の長期インターンに参加しアプリ開発やコミュニティ運営に携わる。',
                    style: theme.textTheme.bodySmall,
                  ),
                  Text(
                    '趣味はお酒・ギター・散歩・プログラミング。',
                    style: theme.textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
