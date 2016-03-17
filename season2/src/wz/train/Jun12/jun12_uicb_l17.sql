
drop table if exists jun12_uicb_2014_12_17;
create table jun12_uicb_2014_12_17 as
select
    a.user_id, a.item_id, a.item_category,
    
    -- hour clicks.
    hour00, hour01, hour02, hour03, hour04, hour05, hour06, hour07, hour08, 
    hour09, hour10, hour11, hour12, hour13, hour14, hour15, hour16, hour17, 
    hour18, hour19, hour20, hour21, hour22, hour23, 
    -- -------------------------------------------------------------------------
    -- new user/item problem.
    -- -------------------------------------------------------------------------
    -- last hour of behavior. - previous 1 day.
    c.ui_bws_cnt ui_pre1_bws_cnt,
    c.ui_max_clt_hr ui_pre1_max_clt_hr,
    c.ui_max_crt_hr ui_pre1_max_crt_hr, 
    c.ui_max_beh_hr ui_pre1_max_beh_hr,
    c.ui_bws_span ui_pre1_bws_span,
    c.ui_beh_span ui_pre1_beh_span,
    c.ui_bws_cnt ui_pre1_beh_cnt,
    c.ui_beh_wgt ui_pre1_beh_wgt,
    c.ui_beh_wgt_pow ui_pre1_beh_wgt_pow,
    c.ui_min_beh_hr ui_pre1_min_beh_hr,
    c.uc_max_beh_hr uc_pre1_max_beh_hr,
    c.uc_min_beh_hr uc_pre1_min_beh_hr,
    c.uc_beh_wgt_pow uc_pre1_beh_wgt_pow,
    c.uc_beh_wgt uc_pre1_beh_wgt,
    
    -- last hour of behavior. - previous 2 day.
    coalesce(d.ui_bws_cnt, 0) ui_pre2_bws_cnt,
    coalesce(d.ui_max_clt_hr, -1) ui_pre2_max_clt_hr,
    coalesce(d.ui_max_crt_hr, -1) ui_pre2_max_crt_hr, 
    coalesce(d.ui_max_buy_hr, -1) ui_pre2_max_buy_hr,
    coalesce(d.ui_max_beh_hr, -1) ui_pre2_max_beh_hr,
    coalesce(d.ui_bws_span, -1) ui_pre2_bws_span,
    coalesce(d.ui_beh_span, -1) ui_pre2_beh_span,
    coalesce(d.ui_beh_cnt, 0) ui_pre2_beh_cnt,
    coalesce(d.ui_beh_wgt, 0) ui_pre2_beh_wgt,
    coalesce(d.ui_beh_wgt_pow, -1) ui_pre2_beh_wgt_pow,
    coalesce(d.ui_min_beh_hr, -1) ui_pre2_min_beh_hr,
    coalesce(d.uc_max_beh_hr, -1) uc_pre2_max_beh_hr,
    coalesce(d.uc_min_beh_hr, -1) uc_pre2_min_beh_hr,
    coalesce(d.uc_beh_wgt_pow, 0) uc_pre2_beh_wgt_pow, 
    coalesce(d.uc_beh_wgt, 0) uc_pre2_beh_wgt,
    
    -- -- previous 3 day
    -- coalesce(e.ui_bws_cnt, 0) ui_pre3_bws_cnt,
    -- coalesce(e.ui_max_clt_hr, -1) ui_pre3_max_clt_hr,
    -- coalesce(e.ui_max_crt_hr, -1) ui_pre3_max_crt_hr,
    -- coalesce(e.ui_max_buy_hr, -1) ui_pre3_max_buy_hr,
    -- coalesce(e.ui_max_beh_hr, -1) ui_pre3_max_beh_hr,
    -- coalesce(e.ui_min_beh_hr, -1) ui_pre3_min_beh_hr,
    -- coalesce(e.ui_bws_span, -1) ui_pre3_bws_span,
    -- coalesce(e.ui_beh_span, -1) ui_pre3_beh_span,
    -- coalesce(e.ui_beh_cnt, 0) ui_pre3_beh_cnt,
    -- coalesce(e.ui_beh_wgt_pow, 0) ui_pre3_beh_wgt_pow,
    -- coalesce(e.ui_beh_wgt, 0) ui_pre3_beh_wgt,
    -- coalesce(e.uc_max_beh_hr, -1) uc_pre3_max_beh_hr,
    -- coalesce(e.uc_min_beh_hr, -1) uc_pre3_min_beh_hr,
    -- coalesce(e.uc_beh_wgt_pow, 0) uc_pre3_beh_wgt_pow, 
    -- coalesce(e.uc_beh_wgt, 0) uc_pre3_beh_wgt,
    
    -- -- previous 4 day
    -- coalesce(f.ui_bws_cnt, 0) ui_pre4_bws_cnt,
    -- coalesce(f.ui_max_clt_hr, -1) ui_pre4_max_clt_hr,
    -- coalesce(f.ui_max_crt_hr, -1) ui_pre4_max_crt_hr,
    -- coalesce(f.ui_max_buy_hr, -1) ui_pre4_max_buy_hr,
    -- coalesce(f.ui_max_beh_hr, -1) ui_pre4_max_beh_hr,
    -- coalesce(f.ui_min_beh_hr, -1) ui_pre4_min_beh_hr,
    -- coalesce(f.ui_bws_span, -1) ui_pre4_bws_span,
    -- coalesce(f.ui_beh_span, -1) ui_pre4_beh_span,
    -- coalesce(f.ui_beh_cnt, 0) ui_pre4_beh_cnt,
    -- coalesce(f.ui_beh_wgt_pow, 0) ui_pre4_beh_wgt_pow,
    -- coalesce(f.ui_beh_wgt, 0) ui_pre4_beh_wgt,
    -- coalesce(f.uc_max_beh_hr, -1) uc_pre4_max_beh_hr,
    -- coalesce(f.uc_min_beh_hr, -1) uc_pre4_min_beh_hr,
    -- coalesce(f.uc_beh_wgt_pow, 0) uc_pre4_beh_wgt_pow, 
    -- coalesce(f.uc_beh_wgt, 0) uc_pre4_beh_wgt,
    
    pro1_user_beh4,
 pro1_user_beh3,
 pro1_user_beh2,
 pro1_user_beh1,
 pro2_user_beh4,
 pro2_user_beh3,
 pro2_user_beh2,
 pro2_user_beh1,
 pro3_user_beh4,
 pro3_user_beh3,
 pro3_user_beh2,
 pro3_user_beh1,
 udiff1,
 udiff2,
 udiff3,
 uavghour1,
 uavghour2,
 uavghour3,
 upro1_bws_to_buy,
 upro1_col_to_buy,
 upro1_crt_to_buy,
 upro2_bws_to_buy,
 upro2_col_to_buy,
 upro2_crt_to_buy,
 upro3_bws_to_buy,
 upro3_col_to_buy,
 upro3_crt_to_buy,
 pro1_item_beh4,
 pro1_item_beh3,
 pro1_item_beh2,
 pro1_item_beh1,
 pro2_item_beh4,
 pro2_item_beh3,
 pro2_item_beh2,
 pro2_item_beh1,
 pro3_item_beh4,
 pro3_item_beh3,
 pro3_item_beh2,
 pro3_item_beh1,
 idiff1,
 idiff2,
 idiff3,
 iavghour1,
 iavghour2,
 iavghour3,
 ipro1_bws_to_buy,
 ipro1_col_to_buy,
 ipro1_crt_to_buy,
 ipro2_bws_to_buy,
 ipro2_col_to_buy,
 ipro2_crt_to_buy,
 ipro3_bws_to_buy,
 ipro3_col_to_buy,
 ipro3_crt_to_buy,
 pro1_chr4_cnt,
 pro2_chr4_cnt,
 pro3_chr4_cnt,
 pro1_chr3_cnt,
 pro2_chr3_cnt,
 pro3_chr3_cnt,
 pro1_chr2_cnt,
 pro2_chr2_cnt,
 pro3_chr2_cnt,
 pro1_geo_range,
 pro2_geo_range,
 pro3_geo_range,
 item_carttobuyrate,
 item_collecttobuyrate,
 item_browsetobuyrate,
 item_in_category_buy_rate,
 item_in_category_cart_rate,
 item_in_category_collect_rate,
 item_in_category_browse_rate,
 category_in_categoryies_buys_rate,
 category_in_categoryies_cart_rate,
 category_in_categoryies_collect_rate,
 category_in_categoryies_browse_rate,
 item_browsetobuyrate1,
 item_browsetobuyrate2,
 item_browsetobuyrate3,
 item_collecttobuyrate1,
 item_collecttobuyrate2,
 item_collecttobuyrate3,
 item_carttobuyrate1,
 item_carttobuyrate2,
 item_carttobuyrate3,
 item_browsetobuyrate1_recent3d,
 item_browsetobuyrate2_recent3d,
 item_browsetobuyrate3_recent3d,
 item_collecttobuyrate1_recent3d,
 item_collecttobuyrate2_recent3d,
 item_collecttobuyrate3_recent3d,
 item_carttobuyrate1_recent3d,
 item_carttobuyrate2_recent3d,
 item_carttobuyrate3_recent3d,
 item_carttobuyrate_recent3d,
 item_collecttobuyrate_recent3d,
 item_browsetobuyrate_recent3d,
 item_in_category_buy_rate_recent3d,
 item_in_category_cart_rate_recent3d,
 item_in_category_collect_rate_recent3d,
 item_in_category_browse_rate_recent3d,
 user_carttobuyrate,
 user_catg_carttobuyrate,
 user_collecttobuyrate,
 user_catg_collecttobuyrate,
 user_browsetobuyrate,
 user_catg_browsetobuyrate,
 ui_item_carttobuyrate_dense_rank,
 ui_item_carttobuyrate_percent_rank,
 ui_item_collecttobuyrate_dense_rank,
 ui_item_collecttobuyrate_percent_rank,
 ui_item_browsetobuyrate_dense_rank,
 ui_item_browsetobuyrate_percent_rank,
 ui_item_in_category_buy_rate_dense_rank,
 ui_item_in_category_buy_rate_percent_rank,
 ui_item_in_category_cart_rate_dense_rank,
 ui_item_in_category_cart_rate_percent_rank,
 ui_item_in_category_collect_rate_dense_rank,
 ui_item_in_category_collect_rate_percent_rank,
 ui_item_in_category_browse_rate_dense_rank,
 ui_item_in_category_browse_rate_percent_rank,
 ui_item_browsetobuyrate1_dense_rank,
 ui_item_browsetobuyrate1_percent_rank,
 ui_item_browsetobuyrate2_dense_rank,
 ui_item_browsetobuyrate2_percent_rank,
 ui_item_browsetobuyrate3_dense_rank,
 ui_item_browsetobuyrate3_percent_rank,
 ui_item_collecttobuyrate1_dense_rank,
 ui_item_collecttobuyrate1_percent_rank,
 ui_item_collecttobuyrate2_dense_rank,
 ui_item_collecttobuyrate2_percent_rank,
 ui_item_collecttobuyrate3_dense_rank,
 ui_item_collecttobuyrate3_percent_rank,
 ui_item_carttobuyrate1_dense_rank,
 ui_item_carttobuyrate1_percent_rank,
 ui_item_carttobuyrate2_dense_rank,
 ui_item_carttobuyrate2_percent_rank,
 ui_item_carttobuyrate3_dense_rank,
 ui_item_carttobuyrate3_percent_rank,
 ui_item_browsetobuyrate1_recent3d_dense_rank,
 ui_item_browsetobuyrate1_recent3d_percent_rank,
 ui_item_browsetobuyrate2_recent3d_dense_rank,
 ui_item_browsetobuyrate2_recent3d_percent_rank,
 ui_item_browsetobuyrate3_recent3d_dense_rank,
 ui_item_browsetobuyrate3_recent3d_percent_rank,
 ui_item_collecttobuyrate1_recent3d_dense_rank,
 ui_item_collecttobuyrate1_recent3d_percent_rank,
 ui_item_collecttobuyrate2_recent3d_dense_rank,
 ui_item_collecttobuyrate2_recent3d_percent_rank,
 ui_item_collecttobuyrate3_recent3d_dense_rank,
 ui_item_collecttobuyrate3_recent3d_percent_rank,
 ui_item_carttobuyrate1_recent3d_dense_rank,
 ui_item_carttobuyrate1_recent3d_percent_rank,
 ui_item_carttobuyrate2_recent3d_dense_rank,
 ui_item_carttobuyrate2_recent3d_percent_rank,
 ui_item_carttobuyrate3_recent3d_dense_rank,
 ui_item_carttobuyrate3_recent3d_percent_rank,
 ui_item_carttobuyrate_recent3d_dense_rank,
 ui_item_carttobuyrate_recent3d_percent_rank,
 ui_item_collecttobuyrate_recent3d_dense_rank,
 ui_item_collecttobuyrate_recent3d_percent_rank,
 ui_item_browsetobuyrate_recent3d_dense_rank,
 ui_item_browsetobuyrate_recent3d_percent_rank,
 ui_item_in_category_buy_rate_recent3d_dense_rank,
 ui_item_in_category_buy_rate_recent3d_percent_rank,
 ui_item_in_category_cart_rate_recent3d_dense_rank,
 ui_item_in_category_cart_rate_recent3d_percent_rank,
 ui_item_in_category_collect_rate_recent3d_dense_rank,
 ui_item_in_category_collect_rate_recent3d_percent_rank,
 ui_item_in_category_browse_rate_recent3d_dense_rank,
 ui_item_in_category_browse_rate_recent3d_percent_rank,
 uc1_dense_rank,
 uc1_percent_rank,
 ui1_dense_rank,
 ui1_percent_rank,
 uc2_dense_rank,
 uc2_percent_rank,
 ui2_dense_rank,
 ui2_percent_rank,
 last_all_score,
 item_buy_cnt,
 user_buy_cnt,
 geo_diff_rep,
 item_buy_cnt3,
 item_buy_cnt2,
 user_buy_cnt3,
 user_buy_cnt2,
 crt_buy_cnt,
 crt_nobuy_cnt,
 col_buy_cnt,
 col_nobuy_cnt,
 bws_buy_cnt,
 bws_nobuy_cnt,
 pro1_buyincate_cnt,
 pro1_crtincate_cnt,
 pro1_colincate_cnt,
 pro1_bwsincate_cnt,
 pro2_buyincate_cnt,
 pro2_crtincate_cnt,
 pro2_colincate_cnt,
 pro2_bwsincate_cnt,
 recent_1day_interval_1d_rebuy_rate,
 recent_2day_interval_1d_rebuy_rate,
 recent_5day_interval_1d_rebuy_rate,
 recent_13day_interval_1d_rebuy_rate,
 recent_25day_interval_1d_rebuy_rate,
 
 a.label
from
    17day_combine_backup_0521_buy_0601 a
    left outer join
    user_item_category_behavior_agg_2014_12_16 c
    on a.user_id=c.user_id and a.item_id=c.item_id
    left outer join
    user_item_category_behavior_agg_2014_12_15 d
    on a.user_id=d.user_id and a.item_id=d.item_id
    -- left outer join
    -- user_item_category_behavior_agg_2014_12_15 e
    -- on a.user_id=e.user_id and a.item_id=e.item_id
    -- left outer join
    -- user_item_category_behavior_agg_2014_12_14 f
    -- on a.user_id=f.user_id and a.item_id=f.item_id
;

select count(*) from jun12_uicb_2014_12_17;
select count(*) from 17day_combine_backup_0521_buy_0601;
