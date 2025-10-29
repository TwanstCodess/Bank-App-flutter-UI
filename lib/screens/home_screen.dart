import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:animate_do/animate_do.dart';
import 'package:iconsax/iconsax.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:shimmer/shimmer.dart';
import 'package:card_swiper/card_swiper.dart';
import 'send_money_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(),
                SizedBox(height: 25.h),
                _buildBalanceCards(),
                SizedBox(height: 30.h),
                _buildQuickActions(context),
                SizedBox(height: 30.h),
                _buildSpendingChart(),
                SizedBox(height: 30.h),
                _buildSectionTitle('Recent Transactions', () {}),
                SizedBox(height: 15.h),
                _buildTransactionsList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return FadeInDown(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Good Morning 👋',
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 5.h),
              Text(
                'Twanst Codes',
                style: TextStyle(
                  fontSize: 28.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Stack(
            children: [
              Container(
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: Color(0xFF6C63FF).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: Icon(
                  Iconsax.notification,
                  color: Color(0xFF6C63FF),
                  size: 26.sp,
                ),
              ),
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  width: 10.w,
                  height: 10.w,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBalanceCards() {
    return FadeInUp(
      child: Container(
        height: 200.h,
        child: Swiper(
          itemCount: 3,
          viewportFraction: 0.85,
          scale: 0.9,
          itemBuilder: (context, index) {
            final cards = [
              {
                'name': 'Main Balance',
                'balance': '\$24,589.50',
                'change': '+12.5%',
                'gradient': [Color(0xFF6C63FF), Color(0xFF5B54E8)],
              },
              {
                'name': 'Savings',
                'balance': '\$12,340.00',
                'change': '+8.2%',
                'gradient': [Color(0xFF00D4FF), Color(0xFF0099CC)],
              },
              {
                'name': 'Investment',
                'balance': '\$8,765.00',
                'change': '+15.7%',
                'gradient': [Color(0xFFFF6B9D), Color(0xFFC86DD7)],
              },
            ];
            
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 5.w),
              padding: EdgeInsets.all(25.w),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: cards[index]['gradient'] as List<Color>,
                ),
                borderRadius: BorderRadius.circular(25.r),
                boxShadow: [
                  BoxShadow(
                    color: (cards[index]['gradient'] as List<Color>)[0].withOpacity(0.3),
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
                      Text(
                        cards[index]['name'] as String,
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16.sp,
                        ),
                      ),
                      Icon(Iconsax.wallet_money, color: Colors.white, size: 30.sp),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cards[index]['balance'] as String,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 36.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Iconsax.arrow_up_3, color: Colors.greenAccent, size: 16.sp),
                            SizedBox(width: 5.w),
                            Text(
                              cards[index]['change'] as String,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(width: 5.w),
                            Text(
                              'this month',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 12.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    return FadeInUp(
      delay: Duration(milliseconds: 200),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildQuickAction(
            Iconsax.send_2,
            'Send',
            Color(0xFF6C63FF),
            () => Navigator.push(context, MaterialPageRoute(builder: (context) => SendMoneyScreen())),
          ),
          _buildQuickAction(Iconsax.scan_barcode, 'Scan', Color(0xFF00D4FF), () {}),
          _buildQuickAction(Iconsax.money_recive, 'Request', Color(0xFFFF6B9D), () {}),
          _buildQuickAction(Iconsax.more, 'More', Color(0xFFFFA726), () {}),
        ],
      ),
    );
  }

  Widget _buildQuickAction(IconData icon, String label, Color color, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 65.w,
            height: 65.w,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [color, color.withOpacity(0.7)],
              ),
              borderRadius: BorderRadius.circular(20.r),
              boxShadow: [
                BoxShadow(
                  color: color.withOpacity(0.3),
                  blurRadius: 15,
                  offset: Offset(0, 8),
                ),
              ],
            ),
            child: Icon(icon, color: Colors.white, size: 30.sp),
          ),
          SizedBox(height: 10.h),
          Text(
            label,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSpendingChart() {
    return FadeInUp(
      delay: Duration(milliseconds: 300),
      child: Container(
        padding: EdgeInsets.all(20.w),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Spending Overview',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                  decoration: BoxDecoration(
                    color: Color(0xFF6C63FF).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Text(
                    'This Week',
                    style: TextStyle(
                      color: Color(0xFF6C63FF),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Container(
              height: 150.h,
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(show: false),
                  titlesData: FlTitlesData(show: false),
                  borderData: FlBorderData(show: false),
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        FlSpot(0, 3),
                        FlSpot(1, 4),
                        FlSpot(2, 3.5),
                        FlSpot(3, 5),
                        FlSpot(4, 4.5),
                        FlSpot(5, 6),
                        FlSpot(6, 5.5),
                      ],
                      isCurved: true,
                      gradient: LinearGradient(
                        colors: [Color(0xFF6C63FF), Color(0xFF00D4FF)],
                      ),
                      barWidth: 3,
                      dotData: FlDotData(show: false),
                      belowBarData: BarAreaData(
                        show: true,
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFF6C63FF).withOpacity(0.3),
                            Color(0xFF00D4FF).withOpacity(0.1),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
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

  Widget _buildSectionTitle(String title, VoidCallback onSeeAll) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextButton(
          onPressed: onSeeAll,
          child: Text(
            'See All',
            style: TextStyle(
              color: Color(0xFF6C63FF),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTransactionsList() {
    final transactions = [
      {'name': 'Netflix', 'amount': '-\$12.99', 'time': 'Today 10:30 AM', 'icon': Iconsax.video_play, 'color': Color(0xFFE50914)},
      {'name': 'Salary', 'amount': '+\$3,500', 'time': 'Yesterday', 'icon': Iconsax.money_send, 'color': Color(0xFF4CAF50)},
      {'name': 'Amazon', 'amount': '-\$89.99', 'time': '2 days ago', 'icon': Iconsax.shopping_cart, 'color': Color(0xFFFF9800)},
      {'name': 'Transfer', 'amount': '-\$150', 'time': '3 days ago', 'icon': Iconsax.arrow_swap_horizontal, 'color': Color(0xFF2196F3)},
    ];

    return Column(
      children: transactions.map((transaction) {
        return FadeInUp(
          delay: Duration(milliseconds: transactions.indexOf(transaction) * 100),
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
                    color: (transaction['color'] as Color).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: Icon(
                    transaction['icon'] as IconData,
                    color: transaction['color'] as Color,
                    size: 24.sp,
                  ),
                ),
                SizedBox(width: 15.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        transaction['name'] as String,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        transaction['time'] as String,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  transaction['amount'] as String,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: (transaction['amount'] as String).startsWith('+')
                        ? Color(0xFF4CAF50)
                        : Color(0xFFE53935),
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}