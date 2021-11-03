CREATE TABLE `rtxac_bans` (
  `id` int(11) NOT NULL,
  `identifier` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `license` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `liveid` varchar(21) CHARACTER SET utf8mb4 DEFAULT NULL,
  `xblid` varchar(21) CHARACTER SET utf8mb4 DEFAULT NULL,
  `discord` varchar(30) CHARACTER SET utf8mb4 DEFAULT NULL,
  `playerip` varchar(25) CHARACTER SET utf8mb4 DEFAULT NULL,
  `playername` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `reason` varchar(9999) CHARACTER SET utf8mb4 NOT NULL DEFAULT '0',
  `banid` varchar(300) CHARACTER SET utf8mb4 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

ALTER TABLE `rtxac_bans`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `rtxac_bans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;
COMMIT;