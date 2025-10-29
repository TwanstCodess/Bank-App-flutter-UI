import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:animate_do/animate_do.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TransactionsScreen extends StatefulWidget {
  @override
  _TransactionsScreenState createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  String selectedFilter = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Transactions',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Iconsax.search_normal, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Iconsax.setting_4, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          _buildFilterChips(),
          SizedBox(height: 20.h),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              children: [
                _buildDateSection('Today', [
                  {'name': 'Starbucks Coffee', 'amount': '-\$5.50', 'time': '10:30 AM', 'icon': Iconsax.coffee, 'color': Color(0xFF00704A)},
                  {'name': 'Uber Ride', 'amount': '-\$12.00', 'time': '08:15 AM', 'icon': Iconsax.car, 'color': Color(0xFF000000)},
                  {'name': 'Freelance Income', 'amount': '+\$850.00', 'time': '07:00 AM', 'icon': Iconsax.wallet_money, 'color': Color(0xFF4CAF50)},
                ]),
                SizedBox(height: 20.h),
                _buildDateSection('Yesterday', [
                  {'name': 'Salary Deposit', 'amount': '+\$3,500.00', 'time': '09:00 AM', 'icon': Iconsax.money_send, 'color': Color(0xFF4CAF50)},
                  {'name': 'Amazon Shopping', 'amount': '-\$89.99', 'time': '02:30 PM', 'icon': Iconsax.shopping_cart, 'color': Color(0xFFFF9800)},
                  {'name': 'Netflix Subscription', 'amount': '-\$12.99', 'time': '07:00 PM', 'icon': Iconsax.video_play, 'color': Color(0xFFE50914)},
                ]),
                SizedBox(height: 20.h),
                _buildDateSection('This Week', [
                  {'name': 'Transfer to Mike', 'amount': '-\$200.00', 'time': 'Mon 3:00 PM', 'icon': Iconsax.arrow_swap_horizontal, 'color': Color(0xFF2196F3)},
                  {'name': 'Grocery Store', 'amount': '-\$85.20', 'time': 'Sun 11:00 AM', 'icon': Iconsax.bag_2, 'color': Color(0xFF4CAF50)},
                  {'name': 'Gym Membership', 'amount': '-\$45.00', 'time': 'Sat 09:00 AM', 'icon': Iconsax.health, 'color': Color(0xFF9C27B0)},
                  {'name': 'Restaurant', 'amount': '-\$67.50', 'time': 'Fri 07:30 PM', 'icon': Iconsax.shop, 'color': Color(0xFFFF5722)},
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChips() {
    final filters = ['All', 'Income', 'Expense', 'Transfer'];
    
    return FadeInDown(
      child: Container(
        height: 50.h,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: filters.length,
          itemBuilder: (context, index) {
            bool isSelected = selectedFilter == filters[index];
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedFilter = filters[index];
                });
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                margin: EdgeInsets.only(right: 12.w),
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                decoration: BoxDecoration(
                  gradient: isSelected
                      ? LinearGradient(
                          colors: [Color(0xFF6C63FF), Color(0xFF5B54E8)],
                        )
                      : null,
                  color: isSelected ? null : Colors.grey[100],
                  borderRadius: BorderRadius.circular(15.r),
                  boxShadow: isSelected
                      ? [
                          BoxShadow(
                            color: Color(0xFF6C63FF).withOpacity(0.3),
                            blurRadius: 10,
                            offset: Offset(0, 5),
                          ),
                        ]
                      : null,
                ),
                child: Center(
                  child: Text(
                    filters[index],
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.grey[700],
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildDateSection(String date, List<Map<String, dynamic>> transactions) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 15.h),
          child: Text(
            date,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
        ),
        ...transactions.asMap().entries.map((entry) {
          int index = entry.key;
          Map<String, dynamic> transaction = entry.value;
          return FadeInUp(
            delay: Duration(milliseconds: index * 100),
            child: _buildTransactionItem(transaction),
          );
        }).toList(),
      ],
    );
  }

  Widget _buildTransactionItem(Map<String, dynamic> transaction) {
    bool isIncome = (transaction['amount'] as String).startsWith('+');
    
    return Slidable(
      endActionPane: ActionPane(
        motion: ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {},
            backgroundColor: Color(0xFF2196F3),
            foregroundColor: Colors.white,
            icon: Iconsax.edit,
            label: 'Edit',
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.r),
              bottomLeft: Radius.circular(15.r),
            ),
          ),
          SlidableAction(
            onPressed: (context) {},
            backgroundColor: Color(0xFFE53935),
            foregroundColor: Colors.white,
            icon: Iconsax.trash,
            label: 'Delete',
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(15.r),
              bottomRight: Radius.circular(15.r),
            ),
          ),
        ],
      ),
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
              width: 55.w,
              height: 55.w,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    (transaction['color'] as Color),
                    (transaction['color'] as Color).withOpacity(0.7),
                  ],
                ),
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Icon(
                transaction['icon'] as IconData,
                color: Colors.white,
                size: 26.sp,
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
                  Row(
                    children: [
                      Icon(Iconsax.clock, size: 12.sp, color: Colors.grey[400]),
                      SizedBox(width: 4.w),
                      Text(
                        transaction['time'] as String,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  transaction['amount'] as String,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: isIncome ? Color(0xFF4CAF50) : Color(0xFFE53935),
                  ),
                ),
                SizedBox(height: 4.h),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: isIncome
                        ? Color(0xFF4CAF50).withOpacity(0.1)
                        : Color(0xFFE53935).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Text(
                    isIncome ? 'Income' : 'Expense',
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w600,
                      color: isIncome ? Color(0xFF4CAF50) : Color(0xFFE53935),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}