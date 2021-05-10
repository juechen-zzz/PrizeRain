TYPE=VIEW
query=select `g`.`id` AS `id`,`g`.`title` AS `title`,`g`.`starttime` AS `starttime`,`g`.`endtime` AS `endtime`,`sd2`.`dict_value` AS `type`,`cgp`.`num` AS `total`,`h`.`num` AS `hit` from (((`prize`.`card_game` `g` left join `prize`.`view_game_productnum` `cgp` on((`g`.`id` = `cgp`.`gameid`))) left join `prize`.`view_game_hitnum` `h` on((`g`.`id` = `h`.`gameid`))) join `prize`.`sys_dict` `sd2` on(((`g`.`type` = `sd2`.`dict_key`) and (`sd2`.`dict_type` = \'card_game_type\'))))
md5=e65d82fd2e783f1bc7ff816164ac2f97
updatable=0
algorithm=0
definer_user=root
definer_host=%
suid=1
with_check_option=0
timestamp=2021-05-01 01:42:43
create-version=1
source=select `g`.`id` AS `id`,`g`.`title` AS `title`,`g`.`starttime` AS `starttime`,`g`.`endtime` AS `endtime`,`sd2`.`dict_value` AS `type`,`cgp`.`num` AS `total`,`h`.`num` AS `hit` from (((`card_game` `g` left join `view_game_productnum` `cgp` on((`g`.`id` = `cgp`.`gameid`))) left join `view_game_hitnum` `h` on((`g`.`id` = `h`.`gameid`))) join `sys_dict` `sd2` on(((`g`.`type` = `sd2`.`dict_key`) and (`sd2`.`dict_type` = \'card_game_type\'))))
client_cs_name=utf8mb4
connection_cl_name=utf8mb4_general_ci
view_body_utf8=select `g`.`id` AS `id`,`g`.`title` AS `title`,`g`.`starttime` AS `starttime`,`g`.`endtime` AS `endtime`,`sd2`.`dict_value` AS `type`,`cgp`.`num` AS `total`,`h`.`num` AS `hit` from (((`prize`.`card_game` `g` left join `prize`.`view_game_productnum` `cgp` on((`g`.`id` = `cgp`.`gameid`))) left join `prize`.`view_game_hitnum` `h` on((`g`.`id` = `h`.`gameid`))) join `prize`.`sys_dict` `sd2` on(((`g`.`type` = `sd2`.`dict_key`) and (`sd2`.`dict_type` = \'card_game_type\'))))
