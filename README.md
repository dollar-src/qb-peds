# PEDS FOR QBCORE

| If you are intested in recieving github updates join the community on **[Discord](https://discord.gg/3t2prQhEhP)**! |



**[PREVIEW](https://www.youtube.com/watch?v=Ud0PXOQYkSY)**




# Dependencies


**[qb-core](https://github.com/qbcore-framework/qb-core)**

**[qb-menu](https://github.com/qbcore-framework/qb-menu)**

**[qb-input](https://github.com/qbcore-framework/qb-input)**




```sql
ALTER TABLE `players`
	ADD COLUMN `pedname` LONGTEXT,
        ADD COLUMN `pedcount`  INT(11) DEFAULT 0
;
````
