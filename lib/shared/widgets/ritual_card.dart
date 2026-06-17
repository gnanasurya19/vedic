import 'package:flutter/material.dart';
import 'package:vedic/core/extentions/style_extention.dart';
import 'package:vedic/core/theme/app_colors.dart';
import 'package:vedic/core/utils/app_utils.dart';
import 'package:vedic/shared/models/ritual_detail_model.dart';

class RitualCard extends StatelessWidget {
  const RitualCard({super.key, required this.ritual});

  final RitualDetailModel ritual;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(context.style.insets.md),

      margin: EdgeInsets.symmetric(vertical: context.style.insets.md, horizontal: 3),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.1),
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: ritual.color,
            ),
            child: Text(
              AppUtils.getInitials(ritual.name??''),
              style: TextStyle(
                color: AppColors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                ritual.name ?? "",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                '${ritual.serviceName ?? ''} - ${ritual.duration ?? ''}',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.black.withValues(alpha: 0.6),
                ),
              ),
              SizedBox(height: 8),
              Row(
                spacing: 4,
                children: [
                  Icon(Icons.calendar_month, size: 14),
                  Text(
                    AppUtils.formatDateTime(ritual.datetime??''),
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.black.withValues(alpha: 0.4),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Spacer(),
          Column(
            spacing: 28,
            children: [
              Text(
                (AppUtils.formatPrice(ritual.totalAmount ?? 0) ).toString(),
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: _getStatusColor(ritual.statusID??0).withValues(alpha: 0.1),
                ),
                child: Row(
                  spacing: 4,
                  children: [
                    Text(
                      ritual.status ?? "",
                      style: context.style.text.semiBold.copyWith(color: _getStatusColor(ritual.statusID??0)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

 Color _getStatusColor(int id){
  
    if(id == 1){
      return Colors.amberAccent; 
    } else if(id == 2){
      return Colors.green;
    } else if(id == 3){
      return Colors.blue;
    } else {
      return Colors.red;
    }
  }
}
