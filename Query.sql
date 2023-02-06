select b.model, c.brand, d.business_group, purchase_date, car_license, e.color, car_km, f.insurance_carrier, policy_number
from prARB.car a 
inner join prARB.model b
on a.id_model = b.id_model
inner join prARB.brand c
on a.id_brand = c.id_brand
inner join prARB.business_group d
on c.id_brand_business_group = d.id_brand_business_group
inner join prARB.color e
on e.id_color = a.id_color
inner join prARB.insurance_carrier f
on f.id_insurance_carrier = a.id_insurance_carrier