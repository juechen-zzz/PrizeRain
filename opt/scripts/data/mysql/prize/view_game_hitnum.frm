TYPE=VIEW
query=select `h`.`gameid` AS `gameid`,count(`h`.`id`) AS `num` from `prize`.`card_user_hit` `h` group by `h`.`gameid`
md5=b45db6f3171faf0ec505afa00806b363
updatable=0
algorithm=0
definer_user=root
definer_host=%
suid=1
with_check_option=0
timestamp=2021-05-01 01:39:40
create-version=1
source=select `h`.`gameid` AS `gameid`,count(`h`.`id`) AS `num` from `card_user_hit` `h` group by `h`.`gameid`
client_cs_name=utf8mb4
connection_cl_name=utf8mb4_general_ci
view_body_utf8=select `h`.`gameid` AS `gameid`,count(`h`.`id`) AS `num` from `prize`.`card_user_hit` `h` group by `h`.`gameid`