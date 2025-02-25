

create database Ola;
use Ola;


#1. Retrieve all successful bookings:
Create View Successful_Bookings As
SELECT * from Bookings
where Booking_Status='Success';

Select * from  Successful_Bookings;


# 2. Find the average ride distance for each vehicle type:

create view Ride_distance_for_each_vehicle As
select Vehicle_Type, avg(Ride_Distance)
as avg_distance from bookings
group by Vehicle_Type;

select * from Ride_distance_for_each_vehicle;

#3. Get the total number of cancelled rides by customers:

create view number_of_cancelled_rides_by_customers as
select count(*) from bookings
where Booking_Status ='Canceled by Customer';

Select * from number_of_cancelled_rides_by_customers;

 

#4. List the top 5 customers who booked the highest number of rides:
create view customers_who_booked_the_highest_number_of_rides as
select Customer_ID, count(Booking_ID) as total_rides
From bookings
group by Customer_ID
order by total_rides desc limit 5;

select * from customers_who_booked_the_highest_number_of_rides;
 

#5. Get the number of rides cancelled by drivers due to personal and car-related issues:
Create view number_of_rides_c_d_p_c as 
SELECT COUNT(*) FROM bookings 
WHERE Canceled_Rides_by_Driver = 'Personal & Car related issue'; 

select * from number_of_rides_c_d_p_c;


#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
Create view Max_min_D_R_primesedan as
select max(Driver_Ratings) as max_rating,
min(Driver_Ratings) as min_rating
from bookings where Vehicle_Type = 'Prime Sedan';

select * from Max_min_D_R_primesedan ;


#7. Retrieve all rides where payment was made using UPI:
create View UPI_payment as
select * from bookings
where Payment_Method = 'UPI';
select * from  UPI_payment;

#select count(*) from bookings
#where Payment_Method = 'UPI';


#8. Find the average customer rating per vehicle type:
create view Avg_cus_rat_Vehtype as
select Vehicle_Type, AVG(Customer_Rating) as avg_Rating
from bookings
group by Vehicle_Type;

select * from Avg_cus_rat_Vehtype;

#9. Calculate the total booking value of rides completed successfully:
create view Total_b_value_successfull as
select sum(Booking_Value) as total_successfull_value
from bookings
where Booking_status ='Success';
select * from Total_b_value_successfull ;


#10. List all incomplete rides along with the reason:
create view Incom_Rid_wit_rea as
select Booking_ID, Incomplete_Rides_Reason 
From bookings
 where Incomplete_Rides ='Yes';
 select * from Incom_Rid_wit_re ; 