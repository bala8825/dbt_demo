with
(
select
      5 as ENTITY_ID,
      CAST(CategoryId AS string) AS Items_Category_Level1_ID
      ,CAST(CategoryContent AS string) AS Items_Category_Level1_Content
      ,CAST(CategoryDescription AS string) AS Items_Category_Level1_Description
      ,CAST(
        CASE
          WHEN UPPER(LTRIM(RTRIM(CategoryType))) = 'ACCESSORIES' THEN 'Accessories'
          WHEN UPPER(LTRIM(RTRIM(CategoryType))) = 'BAG' THEN 'Bag'
          WHEN UPPER(LTRIM(RTRIM(CategoryType))) = 'BRANDED JEWELLERY' THEN 'Branded Jewellery'
          WHEN UPPER(LTRIM(RTRIM(CategoryType))) = 'GOLD' THEN 'Gold'
          WHEN UPPER(LTRIM(RTRIM(CategoryType))) = 'GOLD BAR' THEN 'Gold Bar'
          WHEN UPPER(LTRIM(RTRIM(CategoryType))) = 'JEWELLERY' THEN 'Jewellery'
          WHEN UPPER(LTRIM(RTRIM(CategoryType))) = 'OTHERS' THEN 'Others'
          WHEN UPPER(LTRIM(RTRIM(CategoryType))) = 'PLATINUM' THEN 'Platinum'
          WHEN UPPER(LTRIM(RTRIM(CategoryType))) = 'SHOE' THEN 'Shoe'
          WHEN UPPER(LTRIM(RTRIM(CategoryType))) IN ('WATCH','WATCHES')  THEN 'Watches'
        END
      AS string) AS Items_Category_Level1_Item_Category
      ,STATUS AS Items_Category_Level1_Status
      ,cast(CreatedOn as Timestamp) as _ETL_CreatedOn
      ,CreatedBy as _ETL_CreatedBy
      ,cast(coalesce(UpdatedOn,CreatedOn) as Timestamp) AS _ETL_UpdatedOn
      ,coalesce(UpdatedBy,CreatedBy) AS _ETL_UpdatedBy
  FROM  aspial-bq.dwh_pawn_gpdmsmalaysia.gp_product_rate
  )
