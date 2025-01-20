create database airport

create table passengers(
	id bigint primary key,
	first_name varchar(50),
	last_name varchar(50),
	date_of_birth date,
	country_of_citizenship varchar(50),
	country_of_residence varchar(50),
	passport_number varchar(20),
	created_at datetime,
	updated_at timestamp
)


create table baggage_check(
	id bigint primary key,
	check_result varchar(50),
	created_at bigint,
	updated_at bigint,
	booking_id bigint,
	passenger_id bigint
	)

create table airport(
	id bigint primary key,
	airport_name varchar(50),
	country varchar(50),
	state varchar(50),
	city varchar(50),
	created_at datetime,
	updated_at timestamp
)

create table airline(
	id bigint primary key,
	airline_code varchar,
	airline_name bigint,
	airline_country varchar(50),
	created_at timestamp,
	updated_at varchar
)

create table security_check (
	id bigint primary key,
	check_result varchar(20),
	comments varchar (65),
	created_at datetime,
	updated_at datetime,
	passenger_id bigint
)

create table booking (
	booking_id bigint primary key,
	flight_id bigint,
	status varchar(20),
	booking_platform varchar(20),
	created_at datetime,
	updated_at datetime,
	passenger_id bigint 
)

create table no_fly_list (
	id bigint primary key,
	active_from date,
	active_to date,
	no_fly_reason varchar(255),
	created_at datetime,
	updated_at datetime,
	psngr_id bigint
)

create table flights(
	flight_id bigint primary key,
	departing_gate varchar(20),
	arriving_gate varchar(20),
	created_at datetime,
	updated_at datetime,
	airline_id bigint,
	departing_airport_id bigint,
	arriving_airport_id bigint
)

create table baggage(
	id bigint primary key,
	weight_in_kg decimal(4,2),
	created_date datetime,
	updated_date datetime,
	booking_id bigint
)

create table flight_manifest(
	id bigint primary key,
	created_at datetime,
	updated_at datetime,
	booking_id bigint,
	flight_id bigint
)

create table boarding_pass (
	id bigint primary key,
	qr_code varchar(6553),
	created_at datetime,
	updated_at datetime,
	booking_id bigint
)

alter table no_fly_list 
add constraint fk_no_fly_list
foreign key (psngr_id) references passengers(id)

alter table baggage_check 
add constraint baggage_check_fk
foreign key (passenger_id) references passengers(id)

alter table baggage_check
add constraint baggage_check_fk2
foreign key (booking_id) references booking(booking_id)

alter table security_check
add constraint security_check_fk
foreign key (passenger_id) references passengers(id)

alter table booking 
add constraint booking_fk
foreign key (passenger_id) references passengers(id)

alter table flights
add constraint flights_fk
foreign key (arriving_airport_id) references airport(id)

alter table flights
add constraint flights_fk_airport
foreign key (departing_airport_id) references airport(id)

alter table flights
add constraint flight_fk_airline
foreign key (airline_id) references airline(id)

alter table flight_manifest 
add constraint flight_man_fk
foreign key (flight_id) references flights(flight_id)

alter table boarding_pass 
add constraint boarding_pass_fk
foreign key (booking_id) references booking(booking_id)

alter table flight_manifest
add constraint flight_man_book_fk
foreign key (booking_id) references booking(booking_id)

alter table baggage 
add constraint baggage_book_fk
foreign key(booking_id) references booking(booking_id)