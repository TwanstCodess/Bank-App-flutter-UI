import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:animate_do/animate_do.dart';
import 'package:iconsax/iconsax.dart';
import 'package:card_swiper/card_swiper.dart';

class CardsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 20.h),
                    _buildCardSwiper(),
                    SizedBox(height: 30.h),
                    _buildQuickActions(),
                    SizedBox(height: 30.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Card Settings',
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 15.h),
                          _buildSettingItem(
                            Iconsax.lock,
                            'Freeze Card',
                            'Temporarily disable your card',
                            Color(0xFFE53935),
                          ),
                          _buildSettingItem(
                            Iconsax.card,
                            'Card Details',
                            'View your card information',
                            Color(0xFF6C63FF),
                          ),
                          _buildSettingItem(
                            Iconsax.chart_square,
                            'Manage Limits',
                            'Set spending and withdrawal limits',
                            Color(0xFF00D4FF),
                          ),
                          _buildSettingItem(
                            Iconsax.notification,
                            'Notifications',
                            'Card transaction alerts',
                            Color(0xFFFFA726),
                          ),
                          _buildSettingItem(
                            Iconsax.security_card,
                            'Security',
                            'PIN and security settings',
                            Color(0xFF4CAF50),
                          ),
                          SizedBox(height: 20.h),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return FadeInDown(
      child: Container(
        padding: EdgeInsets.all(20.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'My Cards',
              style: TextStyle(
                fontSize: 28.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF6C63FF), Color(0xFF5B54E8)],
                ),
                borderRadius: BorderRadius.circular(15.r),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF6C63FF).withOpacity(0.3),
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Icon(
                Iconsax.add,
                color: Colors.white,
                size: 24.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCardSwiper() {
    return FadeInUp(
      child: Container(
        height: 230.h,
        child: Swiper(
          itemCount: 3,
          viewportFraction: 0.85,
          scale: 0.9,
          itemBuilder: (context, index) {
            final cards = [
              {
                'type': 'Visa',
                'number': '**** **** **** 4532',
                'balance': '\$12,450.00',
                'expiry': '12/25',
                'gradient': [Color(0xFF6C63FF), Color(0xFF5B54E8)],
                'chip': true,
              },
              {
                'type': 'Mastercard',
                'number': '**** **** **** 8721',
                'balance': '\$8,320.50',
                'expiry': '09/26',
                'gradient': [Color(0xFFFF6B9D), Color(0xFFC86DD7)],
                'chip': true,
              },
              {
                'type': 'American Express',
                'number': '**** **** **** 2345',
                'balance': '\$3,819.00',
                'expiry': '06/24',
                'gradient': [Color(0xFF00D4FF), Color(0xFF0099CC)],
                'chip': true,
              },
            ];

            return _buildCard(
              cards[index]['type'] as String,
              cards[index]['number'] as String,
              cards[index]['balance'] as String,
              cards[index]['expiry'] as String,
              cards[index]['gradient'] as List<Color>,
            );
          },
        ),
      ),
    );
  }

  Widget _buildCard(
    String type,
    String number,
    String balance,
    String expiry,
    List<Color> gradient,
  ) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      padding: EdgeInsets.all(25.w),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: gradient,
        ),
        borderRadius: BorderRadius.circular(25.r),
        boxShadow: [
          BoxShadow(
            color: gradient[0].withOpacity(0.4),
            blurRadius: 20,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    type,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    'Debit Card',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(10.w),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Icon(
                  Iconsax.card_pos,
                  color: Colors.white,
                  size: 30.sp,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: 45.w,
                height: 35.h,
                decoration: BoxDecoration(
                  color: Colors.amber.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              SizedBox(width: 10.w),
              Icon(Iconsax.wifi, color: Colors.white70, size: 24.sp),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                number,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.sp,
                  letterSpacing: 3,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'BALANCE',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 10.sp,
                          letterSpacing: 1,
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        balance,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'VALID THRU',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 10.sp,
                          letterSpacing: 1,
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        expiry,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActions() {
    return FadeInUp(
      delay: Duration(milliseconds: 200),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildQuickAction(Iconsax.card_add, 'Add Card', Color(0xFF6C63FF)),
            _buildQuickAction(Iconsax.arrow_swap_horizontal, 'Transfer', Color(0xFF00D4FF)),
            _buildQuickAction(Iconsax.wallet_money, 'Top Up', Color(0xFF4CAF50)),
            _buildQuickAction(Iconsax.receipt_text, 'History', Color(0xFFFF6B9D)),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickAction(IconData icon, String label, Color color) {
    return Column(
      children: [
        Container(
          width: 65.w,
          height: 65.w,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [color, color.withOpacity(0.7)],
            ),
            borderRadius: BorderRadius.circular(18.r),
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.3),
                blurRadius: 15,
                offset: Offset(0, 8),
              ),
            ],
          ),
          child: Icon(icon, color: Colors.white, size: 28.sp),
        ),
        SizedBox(height: 10.h),
        Text(
          label,
          style: TextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.w600,
            color: Colors.grey[700],
          ),
        ),
      ],
    );
  }

  Widget _buildSettingItem(IconData icon, String title, String subtitle, Color color) {
    return FadeInUp(
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 50.w,
              height: 50.w,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [color, color.withOpacity(0.7)],
                ),
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Icon(icon, color: Colors.white, size: 24.sp),
            ),
            SizedBox(width: 15.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Icon(
                Iconsax.arrow_right_3,
                size: 18.sp,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}