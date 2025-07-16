import 'package:flutter/material.dart';

class DSettingMenutile extends StatelessWidget {
  const DSettingMenutile({super.key, required this.icon, required this.title, required this.subtitle,
    this.trailing, this.ontap});
  final IconData icon;
  final String title,subtitle;
  final Widget? trailing;
  final   VoidCallback? ontap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap:ontap,
      leading: Icon(icon,color:Colors.black),
      title: Text(title,style: Theme.of(context).textTheme.titleMedium,),
      subtitle: Text(subtitle,style: Theme.of(context).textTheme.bodySmall,),
      trailing: trailing,
    );
  }
}
