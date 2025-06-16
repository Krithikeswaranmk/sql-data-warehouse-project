create or alter procedure bronze.load_bronze as 
begin
	begin try
		declare @start_time datetime,@end_time datetime
		print '==================================='
		print 'Loading Bronze Layer'
		print '==================================='

		print '-----------------------------------'
		print 'Loading CRM Tables'
		print '-----------------------------------'

		set @start_time=GETDATE()
		print '>>Truncating Table : bronze.crm_cust_info '
		truncate table bronze.crm_cust_info
		print '>>Inserting Data Into : bronze.crm_cust_info'
		bulk insert bronze.crm_cust_info
		from 'D:\SQL\Projects\Warehouse\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
		with(
			firstrow=2,
			Fieldterminator=',',
			tablock
		)
		set @end_time=GETDATE()
		print '------------------------------------------------------'
		print 'Load duration for bronze.crm_cust_info : ' + cast(datediff(second,@start_time,@end_time) as nvarchar)
		print '------------------------------------------------------' 

		set @start_time = getdate()
		print '>>Truncating Table : bronze.crm_prd_info '
		truncate table bronze.crm_prd_info
		print '>>Inserting Data Into : '
		bulk insert bronze.crm_prd_info
		from 'D:\SQL\Projects\Warehouse\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
		with(
			firstrow=2,
			Fieldterminator=',',
			tablock
		);
		set @end_time= Getdate()
		print '---------------------------------------------'
		print 'Load Duration for bronze.crm_prd_info :' + cast(datediff(second,@start_time,@end_time) as nvarchar)
		print '---------------------------------------------'

		set @start_time = Getdate()
		print '>>Truncating Table : bronze.crm_sales_details '
		truncate table bronze.crm_sales_details
		print '>>Inserting Data Into : bronze.crm_sales_details'
		bulk insert bronze.crm_sales_details
		from 'D:\SQL\Projects\Warehouse\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
		with(
			firstrow=2,
			Fieldterminator=',',
			tablock
		);
		set @end_time=getdate()
		print '---------------------------------------------'
		print 'Load Duration for bronze.crm_sales_details :' + cast(datediff(second,@start_time,@end_time) as nvarchar)
		print '---------------------------------------------'

		set @start_time = Getdate()
		print '>>Truncating Table : bronze.erp_cust_az12 '
		truncate table bronze.erp_cust_az12
		print '>>Inserting Data Into : bronze.erp_cust_az12 '
		bulk insert bronze.erp_cust_az12
		from 'D:\SQL\Projects\Warehouse\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
		with(
			firstrow=2,
			Fieldterminator=',',
			tablock
		);
		set @end_time = GETDATE()
		print '---------------------------------------------'
		print 'Load Duration for bronze.erp_cust_az12 :' + cast(datediff(second,@start_time,@end_time) as nvarchar)
		print '---------------------------------------------'

		set @start_time = GETDATE()
		print '>>Truncating Table : bronze.erp_loc_a101 '
		truncate table bronze.erp_loc_a101
		print '>>Inserting Data Into : bronze.erp_loc_a101 '
		bulk insert bronze.erp_loc_a101
		from 'D:\SQL\Projects\Warehouse\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
		with(
			firstrow=2,
			Fieldterminator=',',
			tablock
		);
		set @end_time=Getdate()
		print '---------------------------------------------'
		print 'Load Duration for bronze.erp_loc_a101 :' + cast(datediff(second,@start_time,@end_time) as nvarchar)
		print '---------------------------------------------'

		set @start_time=getdate()
		print '>>Truncating Table : bronze.erp_px_cat_g1v2 '
		truncate table bronze.erp_px_cat_g1v2
		print '>>Inserting Data Into : bronze.erp_px_cat_g1v2'
		bulk insert bronze.erp_px_cat_g1v2
		from 'D:\SQL\Projects\Warehouse\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
		with(
			firstrow=2,
			Fieldterminator=',',
			tablock
		);
		set @end_time=getdate()
		print '---------------------------------------------'
		print 'Load Duration for bronze.px_cat_g1v2 :' + cast(datediff(second,@start_time,@end_time) as nvarchar)
		print '---------------------------------------------'

	end try
	begin catch
		print '============================================='
		print 'Error Occurding During Loading Bronze Layer'
		print 'Error Message ' + Error_Message();
		print 'Error Number ' + Cast(Error_number() as nvarchar)
		print 'Error Line ' + Cast(Error_line() as nvarchar)
		print 'Error State '+ Cast(Error_state() as nvarchar)
		print '============================================='
	end catch
end

