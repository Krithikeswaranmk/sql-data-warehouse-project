if object_id('silver.crm_cust_info','u') is not null
    drop table silver.crm_cust_info
create table silver.crm_cust_info
(cst_id int,
cst_key nvarchar(50),
cst_firstname nvarchar(50),
cst_lastname nvarchar(50),
cst_marital_status nvarchar(50),
cst_gndr nvarchar(50),
cst_create_date DATE,
dwh_create_date DATETIME2 Default GETDATE()
);

if object_id('silver.crm_prd_info','u') is not null
    drop table silver.crm_prd_info
CREATE TABLE silver.crm_prd_info (
    prd_id INT,
    cat_id NVARCHAR(50),
    prd_key NVARCHAR(50),
    prd_nm NVARCHAR(50),
    prd_cost INT,
    prd_line NVARCHAR(50),
    prd_start_dt DATETIME,
    prd_end_dt DATETIME,
    dwh_create_date DATETIME2 Default GETDATE()
);

if object_id('silver.crm_sales_details','u') is not null
    drop table silver.crm_sales_details
CREATE TABLE silver.crm_sales_details (
    sls_ord_num NVARCHAR(50),
    sls_prd_key NVARCHAR(50),
    sls_cust_id INT,
    sls_order_dt date,
    sls_ship_dt date,
    sls_due_dt date,
    sls_sales INT,
    sls_quantity INT,
    sls_price INT,
    dwh_create_date DATETIME2 Default GETDATE()
);

if object_id('silver.erp_loc_a101','u') is not null
    drop table silver.erp_loc_a101
CREATE TABLE  silver.erp_loc_a101(
cid NVARCHAR(50),
cntry NVARCHAR(50),
dwh_create_date DATETIME2 Default GETDATE()
);

if object_id('silver.erp_cust_az12','u') is not null
    drop table silver.erp_cust_az12
CREATE TABLE silver.erp_cust_az12(
cid NVARCHAR(50),
bdate Date,
gen nvarchar(50),
dwh_create_date DATETIME2 Default GETDATE()
);

if object_id('silver.erp_px_cat_g1v2','u') is not null
    drop table silver.erp_px_cat_g1v2
create table silver.erp_px_cat_g1v2(
id nvarchar(50),
cat nvarchar(50),
subcat nvarchar(50),
maintenance nvarchar(50),
dwh_create_date DATETIME2 Default GETDATE()
);





