---------------------------------------------
-- string functions practice questions
---------------------------------------------

-- q1. product name length analysis (length)

select  product_name,
       length(product_name) as product_length
from products
order by product_length desc;


------------------------------------------------

-- q2. remove extra spaces (trim)

select  product_name,
        trim(product_name) as cleaned_product_name
from products;


------------------------------------------------

-- q3. rename category (replace)

select product_name,
       category,
       replace(category,'Electronics','Electronic Devices') as updated_category
from products;


------------------------------------------------

-- q4. product code (left)

select  product_name,
        left(product_name,3) as product_code
from products;


------------------------------------------------

-- q5. last two letters (right)

select
    product_name,
    right(product_name,2) as last_two_letters
from products;


------------------------------------------------

-- q6. search preview (substring)

select product_name,
       substring(product_name,1,5) as preview
from products;


------------------------------------------------

-- q7. upper & lower case

select
    product_name,
    upper(product_name) as upper_case,
    lower(product_name) as lower_case
from products;


------------------------------------------------

-- q8. product label (concat)

select
    product_name,
    category,
    concat(product_name,' - ',category) as product_label
from products;


------------------------------------------------

-- q9. inventory sticker

select  product_name,
        upper(concat(left(product_name,3),'-',quantity)) as inventory_sticker
from products;


------------------------------------------------

-- q10. product audit

select  product_name,
        length(product_name) as product_length,
        left(product_name,3) as first_three_letters,
        right(product_name,3) as last_three_letters,
        upper(product_name) as upper_case
from products
order by product_length desc;


------------------------------------------------

-- q11. custom sku

select
    product_name,
    concat(upper(left(category,3)),
        '-',
        upper(left(product_name,3)),
        '-',
        lpad(product_id::text,3,'0')
    ) as sku
from products;


------------------------------------------------

-- position()

select product_name,
       position('phone' in product_name) as phone_position
from products;


------------------------------------------------

-- strpos()

select product_name,
       strpos(product_name,'phone') as phone_position
from products;


------------------------------------------------

-- lpad()

select   concat('P',lpad(product_id::text,3,'0')) as product_code
from products;


------------------------------------------------

-- rpad()

select rpad(product_name,20,'*') as padded_name
from products;


------------------------------------------------

-- initcap()

select initcap(product_name) as formatted_name
from products;


------------------------------------------------

-- reverse()

select product_name,
       reverse(product_name) as reversed_name
from products;


------------------------------------------------

-- split_part()

select split_part('mohan123@gmail.com','@',2) as domain;


------------------------------------------------

-- string_agg()

select  string_agg(product_name,' - ') as all_products
from products;