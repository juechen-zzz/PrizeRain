TYPE=VIEW
query=select `h`.`id` AS `id`,`g`.`title` AS `title`,`sd2`.`dict_value` AS `type`,`u`.`uname` AS `uname`,`u`.`realname` AS `realname`,`u`.`idcard` AS `idcard`,`u`.`phone` AS `phone`,`sd1`.`dict_value` AS `level`,`p`.`name` AS `name`,`p`.`price` AS `price`,`h`.`gameid` AS `gameid`,`h`.`userid` AS `userid`,`h`.`productid` AS `productid`,`h`.`hittime` AS `hittime` from (((((`prize`.`card_game` `g` join `prize`.`card_product` `p`) join `prize`.`card_user` `u`) join `prize`.`card_user_hit` `h`) join `prize`.`sys_dict` `sd1` on(((`u`.`level` = `sd1`.`dict_key`) and (`sd1`.`dict_type` = \'card_user_level\')))) join `prize`.`sys_dict` `sd2` on(((`g`.`type` = `sd2`.`dict_key`) and (`sd2`.`dict_type` = \'card_game_type\')))) where ((`h`.`gameid` = `g`.`id`) and (`h`.`userid` = `u`.`id`) and (`h`.`productid` = `p`.`id`))
md5=78c3c85ec7d03c221c8150cc4498cf02
updatable=1
algorithm=0
definer_user=root
definer_host=%
suid=1
with_check_option=0
timestamp=2021-05-01 01:43:04
create-version=1
source=select `h`.`id` AS `id`,`g`.`title` AS `title`,`sd2`.`dict_value` AS `type`,`u`.`uname` AS `uname`,`u`.`realname` AS `realname`,`u`.`idcard` AS `idcard`,`u`.`phone` AS `phone`,`sd1`.`dict_value` AS `level`,`p`.`name` AS `name`,`p`.`price` AS `price`,`h`.`gameid` AS `gameid`,`h`.`userid` AS `userid`,`h`.`productid` AS `productid`,`h`.`hittime` AS `hittime` from (((((`card_game` `g` join `card_product` `p`) join `card_user` `u`) join `card_user_hit` `h`) join `sys_dict` `sd1` on(((`u`.`level` = `sd1`.`dict_key`) and (`sd1`.`dict_type` = \'card_user_level\')))) join `sys_dict` `sd2` on(((`g`.`type` = `sd2`.`dict_key`) and (`sd2`.`dict_type` = \'card_game_type\')))) where ((`h`.`gameid` = `g`.`id`) and (`h`.`userid` = `u`.`id`) and (`h`.`productid` = `p`.`id`))
client_cs_name=utf8mb4
connection_cl_name=utf8mb4_general_ci
view_body_utf8=select `h`.`id` AS `id`,`g`.`title` AS `title`,`sd2`.`dict_value` AS `type`,`u`.`uname` AS `uname`,`u`.`realname` AS `realname`,`u`.`idcard` AS `idcard`,`u`.`phone` AS `phone`,`sd1`.`dict_value` AS `level`,`p`.`name` AS `name`,`p`.`price` AS `price`,`h`.`gameid` AS `gameid`,`h`.`userid` AS `userid`,`h`.`productid` AS `productid`,`h`.`hittime` AS `hittime` from (((((`prize`.`card_game` `g` join `prize`.`card_product` `p`) join `prize`.`card_user` `u`) join `prize`.`card_user_hit` `h`) join `prize`.`sys_dict` `sd1` on(((`u`.`level` = `sd1`.`dict_key`) and (`sd1`.`dict_type` = \'card_user_level\')))) join `prize`.`sys_dict` `sd2` on(((`g`.`type` = `sd2`.`dict_key`) and (`sd2`.`dict_type` = \'card_game_type\')))) where ((`h`.`gameid` = `g`.`id`) and (`h`.`userid` = `u`.`id`) and (`h`.`productid` = `p`.`id`))
