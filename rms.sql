-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 10, 2023 at 06:08 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rms`
--

-- --------------------------------------------------------

--
-- Table structure for table `order_item_table`
--

CREATE TABLE `order_item_table` (
  `order_item_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `product_quantity` int(4) NOT NULL,
  `product_rate` decimal(12,2) NOT NULL,
  `product_amount` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `order_item_table`
--

INSERT INTO `order_item_table` (`order_item_id`, `order_id`, `product_name`, `product_quantity`, `product_rate`, `product_amount`) VALUES
(1, 1, 'Oreo Milkshake', 2, '180.00', '360.00'),
(2, 2, 'Mac And Cheese', 3, '340.00', '1020.00'),
(3, 3, 'Greek Salad Feta Cheese', 1, '240.00', '240.00'),
(4, 4, 'Greek Salad Feta Cheese', 1, '240.00', '240.00');

-- --------------------------------------------------------

--
-- Table structure for table `order_table`
--

CREATE TABLE `order_table` (
  `order _id` int(11) NOT NULL,
  `order_number` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `order_table` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `order_gross_amount` decimal(12,2) NOT NULL,
  `order_tax_amount` decimal(12,2) NOT NULL,
  `order_net_amount` decimal(12,2) NOT NULL,
  `order_date` date NOT NULL,
  `order_time` time NOT NULL,
  `order_waiter` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `order_cashier` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `order_status` enum('In Process','Completed') COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `order_table`
--

INSERT INTO `order_table` (`order_id`, `order_number`, `order_table`, `order_gross_amount`, `order_tax_amount`, `order_net_amount`, `order_date`, `order_time`, `order_waiter`, `order_cashier`, `order_status`) VALUES
(1, '100000', 'Table 1', '360.00', '69.30', '429.30', '2023-01-09', '15:30:23', 'Master', 'cashier', 'Completed'),
(2, '100001', 'Table 2', '0.00', '0.00', '0.00', '2023-01-09', '15:32:04', 'Master', '', 'In Process'),
(3, '100002', 'Table 3', '240.00', '46.20', '286.20', '2023-01-09', '15:59:13', 'Master', 'cashier', 'Completed'),
(4, '100003', 'Table 1', '240.00', '46.20', '286.20', '2023-01-10', '10:21:27', 'waiter', 'cashier', 'Completed');

-- --------------------------------------------------------

--
-- Table structure for table `order_tax_table`
--

CREATE TABLE `order_tax_table` (
  `order_tax_table_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_tax_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `order_tax_percentage` decimal(4,2) NOT NULL,
  `order_tax_amount` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `order_tax_table`
--

INSERT INTO `order_tax_table` (`order_tax_table_id`, `order_id`, `order_tax_name`, `order_tax_percentage`, `order_tax_amount`) VALUES
(1, 1, 'Govt Taxes', '19.25', '69.30'),
(2, 3, 'Govt Taxes', '19.25', '46.20'),
(3, 4, 'Govt Taxes', '19.25', '46.20');

-- --------------------------------------------------------

--
-- Table structure for table `product_category_table`
--

CREATE TABLE `product_category_table` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `category_status` enum('Enable','Disable') COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_category_table`
--

INSERT INTO `product_category_table` (`category_id`, `category_name`, `category_status`) VALUES
(1, 'Pizzas', 'Enable'),
(2, 'Soups', 'Enable'),
(3, 'Salads', 'Enable'),
(4, 'Pastas', 'Enable'),
(5, 'Beverages', 'Enable'),
(6, 'Smoothies', 'Enable');

-- --------------------------------------------------------

--
-- Table structure for table `product_table`
--

CREATE TABLE `product_table` (
  `product_id` int(11) NOT NULL,
  `category_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `product_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `product_price` decimal(10,2) NOT NULL,
  `product_status` enum('Enable','Disable') COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_table`
--

INSERT INTO `product_table` (`product_id`, `category_name`, `product_name`, `product_price`, `product_status`) VALUES
(1, 'Beverages', 'Oreo Milkshake', '180.00', 'Enable'),
(2, 'Beverages', 'Chocolate Brownie Milkshake', '190.00', 'Enable'),
(3, 'Pastas', 'Mac And Cheese', '340.00', 'Enable'),
(4, 'Pastas', 'Veg Lasagna', '345.00', 'Enable'),
(5, 'Pizzas', 'Veg Quesadilla', '340.00', 'Enable'),
(6, 'Salads', 'Greek Salad Feta Cheese', '240.00', 'Enable'),
(7, 'Salads', 'Cottage Cheese Steak With Harissa Sauce', '340.00', 'Enable'),
(8, 'Soups', 'Healthy Veg Minestrone Soup', '190.00', 'Enable'),
(9, 'Soups', 'Roasted Basil Tomato Soup', '450.00', 'Enable'),
(10, 'Smoothies', 'Mango', '100.00', 'Enable');

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_table`
--

CREATE TABLE `restaurant_table` (
  `restaurant_id` int(11) NOT NULL,
  `restaurant_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `restaurant_tag_line` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `restaurant_address` text COLLATE utf8_unicode_ci NOT NULL,
  `restaurant_contact_no` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `restaurant_email` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `restaurant_currency` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `restaurant_timezone` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `restaurant_logo` varchar(250) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `restaurant_table`
--

INSERT INTO `restaurant_table` (`restaurant_id`, `restaurant_name`, `restaurant_tag_line`, `restaurant_address`, `restaurant_contact_no`, `restaurant_email`, `restaurant_currency`, `restaurant_timezone`, `restaurant_logo`) VALUES
(1, 'ASH CAFE', 'Pastas, Desserts', 'KANKANADY', '9999955555', 'ashcafe@gmail.com', 'INR', 'Asia/Kolkata', '');

-- --------------------------------------------------------

--
-- Table structure for table `table_data`
--

CREATE TABLE `table_data` (
  `table_id` int(11) NOT NULL,
  `table_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `table_capacity` int(3) NOT NULL,
  `table_status` enum('Enable','Disable') COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `table_data`
--

INSERT INTO `table_data` (`table_id`, `table_name`, `table_capacity`, `table_status`) VALUES
(1, 'Table 1', 2, 'Enable'),
(2, 'Table 2', 2, 'Enable'),
(3, 'Table 3', 3, 'Enable'),
(4, 'Table 4', 3, 'Enable');

-- --------------------------------------------------------

--
-- Table structure for table `tax_table`
--

CREATE TABLE `tax_table` (
  `tax_id` int(11) NOT NULL,
  `tax_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `tax_percentage` decimal(4,2) NOT NULL,
  `tax_status` enum('Enable','Disable') COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tax_table`
--

INSERT INTO `tax_table` (`tax_id`, `tax_name`, `tax_percentage`, `tax_status`) VALUES
(1, 'Govt Taxes', '19.25', 'Enable');

-- --------------------------------------------------------

--
-- Table structure for table `user_table`
--

CREATE TABLE `user_table` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `user_contact_no` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `user_email` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `user_password` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `user_profile` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `user_type` enum('Master','Waiter','Cashier') COLLATE utf8_unicode_ci NOT NULL,
  `user_status` enum('Enable','Disable') COLLATE utf8_unicode_ci NOT NULL,
  `user_created_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_table`
--

INSERT INTO `user_table` (`user_id`, `user_name`, `user_contact_no`, `user_email`, `user_password`, `user_profile`, `user_type`, `user_status`, `user_created_on`) VALUES
(1, 'ASH CAFE', '9999955555', 'ashcafe@gmail.com', 'ashcafe', 'images/1373982669.png', 'Master', 'Enable', '2023-01-09 10:29:26'),
(2, 'waiter', '9999922222', 'waiter@gmail.com', 'waiter', 'images/2059582096.png', 'Waiter', 'Enable', '2023-01-09 15:16:30'),
(3, 'cashier', '9999911111', 'cashier@gmail.com', 'cashier', 'images/924769557.png', 'Cashier', 'Enable', '2023-01-09 15:18:10');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `order_item_table`
--
ALTER TABLE `order_item_table`
  ADD PRIMARY KEY (`order_item_id`);

--
-- Indexes for table `order_table`
--
ALTER TABLE `order_table`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `order_tax_table`
--
ALTER TABLE `order_tax_table`
  ADD PRIMARY KEY (`order_tax_table_id`);

--
-- Indexes for table `product_category_table`
--
ALTER TABLE `product_category_table`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `product_table`
--
ALTER TABLE `product_table`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `restaurant_table`
--
ALTER TABLE `restaurant_table`
  ADD PRIMARY KEY (`restaurant_id`);

--
-- Indexes for table `table_data`
--
ALTER TABLE `table_data`
  ADD PRIMARY KEY (`table_id`);

--
-- Indexes for table `tax_table`
--
ALTER TABLE `tax_table`
  ADD PRIMARY KEY (`tax_id`);

--
-- Indexes for table `user_table`
--
ALTER TABLE `user_table`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `order_item_table`
--
ALTER TABLE `order_item_table`
  MODIFY `order_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `order_table`
--
ALTER TABLE `order_table`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `order_tax_table`
--
ALTER TABLE `order_tax_table`
  MODIFY `order_tax_table_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product_category_table`
--
ALTER TABLE `product_category_table`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `product_table`
--
ALTER TABLE `product_table`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `restaurant_table`
--
ALTER TABLE `restaurant_table`
  MODIFY `restaurant_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `table_data`
--
ALTER TABLE `table_data`
  MODIFY `table_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tax_table`
--
ALTER TABLE `tax_table`
  MODIFY `tax_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_table`
--
ALTER TABLE `user_table`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
