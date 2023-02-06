create schema prARB authorization wuhhqfrh;

create table prARB.car (
 id_car varchar(10) not null, --PK
 id_brand varchar(5) not null,
 id_model integer not null, --FK
 id_color integer not null, --FK
 car_km integer not null,
 policy_number varchar (20) not null UNIQUE,
 id_insurance_carrier varchar (5) not null,
 purchase_date date not null,
 car_license varchar(10) not null UNIQUE
);

--PK car table
alter table prARB.car
add constraint car_PK primary key (id_car);


create table prARB.model (
 id_model integer not null, --PK
 model varchar (30) not null,
 id_brand varchar (5) not null --FK
);

--PK model table
alter table prARB.model
add constraint id_model_PK primary key (id_model);


create table prARB.color (
 id_color integer not null, --PK
 color varchar (30) not null
);

--PK color table
alter table prARB.color
add constraint id_color_PK primary key (id_color);


create table prARB.brand (
 id_brand varchar (5) not null, --PK
 brand varchar (20) not null,
 id_brand_business_group varchar (5) not null --FK
);

--PK brand table
alter table prARB.brand
add constraint brand_PK primary key (id_brand);

 
create table prARB.business_group(
 id_brand_business_group varchar (5) not null, --PK
 business_group varchar (30) not null
);

--PK business group table
alter table prARB.business_group
add constraint business_group_PK primary key (id_brand_business_group);


create table prARB.insurance_carrier(
 id_insurance_carrier varchar (5) not null, --PK
 insurance_carrier varchar (30) not null
 );

--PK insurrance carrier table
alter table prARB.insurance_carrier
add constraint insurance_carrier_PK primary key (id_insurance_carrier);


create table prARB.car_inspection(
 id_car varchar(10) not null, --PK,FK
 id_inspection varchar (15) not null, --PK
 id_kind varchar (10) not null, --FK
 id_inspection_result integer not null, --FK
 inspection_description varchar (300) null,
 inspection_cost float not null,
 id_currency varchar (5) not null, --FK
 current_km integer not null,
 inspection_date date not null
 );

--PK car inspection table
alter table prARB.car_inspection
add constraint car_inspection_PK primary key (id_car, id_inspection);

 
create table prARB.inspection_kind(
 id_kind varchar (10) not null, --PK
 kind varchar (30) not null
 );

--PK inspection_kind table
alter table prARB.inspection_kind
add constraint inspection_kind_PK primary key (id_kind);
 
create table prARB.inspection_result(
 id_inspection_result integer not null, --PK
 booleanresult varchar (1) not null
 );

--PK inspection result (boolean) PK
alter table prARB.inspection_result
add constraint id_inspection_result_PK primary key (id_inspection_result);
  
create table prARB.currency(
 id_currency varchar (5) not null, --PK
 currency varchar (30) not null
 );

-- currency table PK
alter table prARB.currency
add constraint id_currency_PK primary key (id_currency);

--FK car table
alter table prARB.car
add constraint car_model_FK foreign key (id_model)
references prARB.model(id_model); 

alter table prARB.car
add constraint car_color_FK foreign key (id_color)
references prARB.color (id_color);

alter table prARB.car
add constraint insurance_carrier_FK foreign key (id_insurance_carrier)
references prARB.insurance_carrier (id_insurance_carrier);

--FK model
alter table prARB.model
add constraint id_brand_FK foreign key (id_brand)
references prARB.brand (id_brand);

--FK brand
alter table prARB.brand
add constraint id_brand_business_group_FK foreign key (id_brand_business_group)
references prARB.business_group (id_brand_business_group);

--FK car inspection
alter table prARB.car_inspection
add constraint id_car_FK foreign key (id_car)
references prARB.car (id_car);

alter table prARB.car_inspection
add constraint id_kind_FK foreign key (id_kind)
references prARB.inspection_kind (id_kind);

alter table prARB.car_inspection
add constraint id_inspection_result_FK foreign key (id_inspection_result)
references prARB.inspection_result (id_inspection_result);

alter table prARB.car_inspection
add constraint id_currency_FK foreign key (id_currency)
references prARB.currency (id_currency);

--Data business group
insert into prARB.business_group (id_brand_business_group,business_group) values ('VOL','Volkswagen');
insert into prARB.business_group (id_brand_business_group,business_group) values ('FCA','FCA');
insert into prARB.business_group (id_brand_business_group,business_group) values ('RNN','Renault Nissan');
insert into prARB.business_group (id_brand_business_group,business_group) values ('FOR','FORD');
insert into prARB.business_group (id_brand_business_group,business_group) values ('PSA','PSA');

--Data brand
insert into prARB.brand (id_brand, brand, id_brand_business_group) values ('Au1','Audi','VOL');
insert into prARB.brand (id_brand, brand, id_brand_business_group) values ('Se1','Seat','VOL');
insert into prARB.brand (id_brand, brand, id_brand_business_group) values ('Je1','Jeep','FCA');
insert into prARB.brand (id_brand, brand, id_brand_business_group) values ('Ni1','Nissan','RNN');
insert into prARB.brand (id_brand, brand, id_brand_business_group) values ('Fo1','Ford','FOR');
insert into prARB.brand (id_brand, brand, id_brand_business_group) values ('Ci1','Citroen','PSA');
insert into prARB.brand (id_brand, brand, id_brand_business_group) values ('Op1','Opel','PSA');
insert into prARB.brand (id_brand, brand, id_brand_business_group) values ('Vo1','Volkswagen','VOL');

--Data model
insert into prARB.model (id_model,model,id_brand) values ('1','Q8 TFSie','Au1');
insert into prARB.model (id_model,model,id_brand) values ('2','Q7 TFSie','Au1');
insert into prARB.model (id_model,model,id_brand) values ('3','Ateca Style XM','Se1');
insert into prARB.model (id_model,model,id_brand) values ('4','Ateca X-Perience XM','Se1');
insert into prARB.model (id_model,model,id_brand) values ('5','Avenger','Je1');
insert into prARB.model (id_model,model,id_brand) values ('6','Leaf','Ni1');
insert into prARB.model (id_model,model,id_brand) values ('7','Mustang Mach-E','Fo1');
insert into prARB.model (id_model,model,id_brand) values ('8','Puma Titanium','Fo1');
insert into prARB.model (id_model,model,id_brand) values ('9','Puma ST LineX','Fo1');
insert into prARB.model (id_model,model,id_brand) values ('10','E-SpaceTourer','Ci1');
insert into prARB.model (id_model,model,id_brand) values ('11','Corsa','Op1');
insert into prARB.model (id_model,model,id_brand) values ('12','ID-4.GTX','Vo1');
insert into prARB.model (id_model,model,id_brand) values ('13','T-Cross','Vo1');

--Data color
insert into prARB.color (id_color,color) values ('1','Black');
insert into prARB.color (id_color,color) values ('2','Blue');
insert into prARB.color (id_color,color) values ('3','Dark blue');
insert into prARB.color (id_color,color) values ('4','Dark green');
insert into prARB.color (id_color,color) values ('5','Dark grey');
insert into prARB.color (id_color,color) values ('6','Light blue');
insert into prARB.color (id_color,color) values ('7','Light grey');
insert into prARB.color (id_color,color) values ('8','Orange');
insert into prARB.color (id_color,color) values ('9','Red');
insert into prARB.color (id_color,color) values ('10','White');
insert into prARB.color (id_color,color) values ('11','Yellow');

--Data insurrance
insert into prARB.insurance_carrier (id_insurance_carrier, insurance_carrier) values ('ASG1','Mapfre');
insert into prARB.insurance_carrier (id_insurance_carrier, insurance_carrier) values ('ASG2','Mutua Madrileña');
insert into prARB.insurance_carrier (id_insurance_carrier, insurance_carrier) values ('ASG3','AXA');
insert into prARB.insurance_carrier (id_insurance_carrier, insurance_carrier) values ('ASG4','Allianz');
insert into prARB.insurance_carrier (id_insurance_carrier, insurance_carrier) values ('ASG5','Linea directa');

--inspection result boolean
insert into prARB.inspection_result (id_inspection_result, booleanresult) values ('0','F');
insert into prARB.inspection_result (id_inspection_result, booleanresult) values ('1','T');

--data inspection_kind
insert into prARB.inspection_kind (id_kind,kind) values ('INS1','Courtesy Inspection');
insert into prARB.inspection_kind (id_kind,kind) values ('INS2','Insurance Inspection');
insert into prARB.inspection_kind (id_kind,kind) values ('INS3','12-point inspection');
insert into prARB.inspection_kind (id_kind,kind) values ('INS4','ITV');

--Data currency
insert into prARB.currency (id_currency,currency) values ('EU','€');
insert into prARB.currency (id_currency,currency) values ('EEUU','$');
insert into prARB.currency (id_currency,currency) values ('UK','£');

--Data car table
insert into prARB.car (id_car,id_brand,id_model,id_color,car_km,policy_number,id_insurance_carrier,purchase_date,car_license) values('Au001','Au1','1','1','23145','37365719','ASG1','11/07/2022','0088NJO');
insert into prARB.car (id_car,id_brand,id_model,id_color,car_km,policy_number,id_insurance_carrier,purchase_date,car_license) values('Au002','Au1','2','3','35222','71464094','ASG1','02/03/2021','7862FDR');
insert into prARB.car (id_car,id_brand,id_model,id_color,car_km,policy_number,id_insurance_carrier,purchase_date,car_license) values('Au003','Au1','2','2','31867','23272454','ASG2','02/03/2021','6673FIH');
insert into prARB.car (id_car,id_brand,id_model,id_color,car_km,policy_number,id_insurance_carrier,purchase_date,car_license) values('Se001','Se1','3','10','23148','69877669','ASG3','06/20/2022','0500IXQ');
insert into prARB.car (id_car,id_brand,id_model,id_color,car_km,policy_number,id_insurance_carrier,purchase_date,car_license) values('Se002','Se1','3','7','20205','57676673','ASG3','06/10/2022','7555AAI');
insert into prARB.car (id_car,id_brand,id_model,id_color,car_km,policy_number,id_insurance_carrier,purchase_date,car_license) values('Se003','Se1','4','1','42431','39875865','ASG1','01/14/2020','4859XWZ');
insert into prARB.car (id_car,id_brand,id_model,id_color,car_km,policy_number,id_insurance_carrier,purchase_date,car_license) values('Je001','Je1','5','7','52100','75499632','ASG1','05/01/2020','2524GBC');
insert into prARB.car (id_car,id_brand,id_model,id_color,car_km,policy_number,id_insurance_carrier,purchase_date,car_license) values('Je002','Je1','5','9','43780','14339540','ASG1','02/02/2022','1434TPT');
insert into prARB.car (id_car,id_brand,id_model,id_color,car_km,policy_number,id_insurance_carrier,purchase_date,car_license) values('Ni001','Ni1','6','9','14200','88233608','ASG2','01/03/2023','7791GFL');
insert into prARB.car (id_car,id_brand,id_model,id_color,car_km,policy_number,id_insurance_carrier,purchase_date,car_license) values('Ni002','Ni1','6','8','13200','96895463','ASG2','12/07/2023','3704OUZ');
insert into prARB.car (id_car,id_brand,id_model,id_color,car_km,policy_number,id_insurance_carrier,purchase_date,car_license) values('Fo001','Fo1','7','8','16742','73686170','ASG5','08/04/2022','2634CVR');
insert into prARB.car (id_car,id_brand,id_model,id_color,car_km,policy_number,id_insurance_carrier,purchase_date,car_license) values('Fo002','Fo1','8','3','12320','15008225','ASG5','07/05/2021','1439PJQ');
insert into prARB.car (id_car,id_brand,id_model,id_color,car_km,policy_number,id_insurance_carrier,purchase_date,car_license) values('Fo003','Fo1','9','4','34123','16715608','ASG5','05/15/2019','9098RCB');
insert into prARB.car (id_car,id_brand,id_model,id_color,car_km,policy_number,id_insurance_carrier,purchase_date,car_license) values('Ci001','Ci1','10','5','67320','44352889','ASG1','04/01/2017','3003DMP');
insert into prARB.car (id_car,id_brand,id_model,id_color,car_km,policy_number,id_insurance_carrier,purchase_date,car_license) values('Op001','Op1','11','6','77230','74488742','ASG4','01/03/2018','5064GEL');
insert into prARB.car (id_car,id_brand,id_model,id_color,car_km,policy_number,id_insurance_carrier,purchase_date,car_license) values('Op002','Op1','11','9','74215','43662319','ASG4','06/05/2019','7244PMU');
insert into prARB.car (id_car,id_brand,id_model,id_color,car_km,policy_number,id_insurance_carrier,purchase_date,car_license) values('Op003','Op1','11','9','54421','72273498','ASG4','11/05/2017','4665TEB');
insert into prARB.car (id_car,id_brand,id_model,id_color,car_km,policy_number,id_insurance_carrier,purchase_date,car_license) values('Op004','Op1','11','6','82399','91747668','ASG4','07/12/2018','9097OWO');
insert into prARB.car (id_car,id_brand,id_model,id_color,car_km,policy_number,id_insurance_carrier,purchase_date,car_license) values('Vo001','Vo1','12','1','1200','10220834','ASG1','08/16/2020','BWA6665E');
insert into prARB.car (id_car,id_brand,id_model,id_color,car_km,policy_number,id_insurance_carrier,purchase_date,car_license) values('Vo002','Vo1','13','4','12325','71334929','ASG2','07/20/2018','M061521');

--Data inpsections

insert into prARB.car_inspection (id_car,id_inspection,id_kind,id_inspection_result,inspection_description,inspection_cost,id_currency,current_km,inspection_date) values ('Ci001', 'INS1001', 'INS1', '1','KM0','0','EU','245','04/01/2017');
insert into prARB.car_inspection (id_car,id_inspection,id_kind,id_inspection_result,inspection_description,inspection_cost,id_currency,current_km,inspection_date) values ('Ci001', 'INS4001', 'INS4', '1','Mandatory','41.65','EU','39842','12/18/2020');
insert into prARB.car_inspection (id_car,id_inspection,id_kind,id_inspection_result,inspection_description,inspection_cost,id_currency,current_km,inspection_date) values ('Se001', 'INS1002', 'INS2', '1','Car accident, improper fault','300','EU','18540','08/18/2022');
insert into prARB.car_inspection (id_car,id_inspection,id_kind,id_inspection_result,inspection_description,inspection_cost,id_currency,current_km,inspection_date) values ('Op004', 'INS4002', 'INS4', '1','Mandatory','42.90','EU','50345','12/18/2020');
insert into prARB.car_inspection (id_car,id_inspection,id_kind,id_inspection_result,inspection_description,inspection_cost,id_currency,current_km,inspection_date) values ('Op002', 'INS4003', 'INS4', '1','Mandatory','44.56','EU','46703','12/12/2021');
insert into prARB.car_inspection (id_car,id_inspection,id_kind,id_inspection_result,inspection_description,inspection_cost,id_currency,current_km,inspection_date) values ('Op001', 'INS4004', 'INS4', '1','Mandtaory','48.75','EU','64302','6/6/2022');
insert into prARB.car_inspection (id_car,id_inspection,id_kind,id_inspection_result,inspection_description,inspection_cost,id_currency,current_km,inspection_date) values ('Vo002', 'INS4005', 'INS4', '1','Mandatory','48.75','EU','8230','7/6/2022');
insert into prARB.car_inspection (id_car,id_inspection,id_kind,id_inspection_result,inspection_description,inspection_cost,id_currency,current_km,inspection_date) values ('Fo003', 'INS1002', 'INS2', '0','Clutch, not covered by insurance','1941.48','EEUU','7998','07/29/2020');


