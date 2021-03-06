-- 单位的配置
UnitCfg = 
{
    [1] = {m_cfgId = 1, m_name = "测试怪物1", m_attackType = 1, m_attackD = 0, m_attackU = 1, m_phyDefD = 0, m_phyDefU = 2, m_accuracy = 0, m_agile = 0, m_magicAvoid = 1, m_poisonRemuse = 1, m_poolIndex = 0},
    [2] = {m_cfgId = 2, m_name = "测试怪物2", m_attackType = 1, m_attackD = 0, m_attackU = 1, m_phyDefD = 0, m_phyDefU = 0, m_accuracy = 0, m_agile = 0, m_magicAvoid = 1, m_poisonRemuse = 1, m_poolIndex = 0},
}
-- 英雄配置
HeroCfg = 
{
    -- 战士
    [1] = {
    
    -- HP值 MP值 背包负重 负重量 腕力 攻击力 防御力 
        [1 ] = { m_hp = 19 , m_mp = 15 , m_bagHeavy = 50 , m_roleHeavy = 15 , m_brawn = 12 , m_attackD = 1, m_attackU = 1 , m_phyDefD = 0, m_phyDefU = 0 },
        [2 ] = { m_hp = 24 , m_mp = 18 , m_bagHeavy = 51 , m_roleHeavy = 15 , m_brawn = 12 , m_attackD = 1, m_attackU = 1 , m_phyDefD = 0, m_phyDefU = 0 },
        [3 ] = { m_hp = 30 , m_mp = 21 , m_bagHeavy = 53 , m_roleHeavy = 15 , m_brawn = 13 , m_attackD = 1, m_attackU = 1 , m_phyDefD = 0, m_phyDefU = 0 },
        [4 ] = { m_hp = 37 , m_mp = 25 , m_bagHeavy = 55 , m_roleHeavy = 16 , m_brawn = 13 , m_attackD = 1, m_attackU = 1 , m_phyDefD = 0, m_phyDefU = 0 },
        [5 ] = { m_hp = 44 , m_mp = 29 , m_bagHeavy = 58 , m_roleHeavy = 16 , m_brawn = 14 , m_attackD = 1, m_attackU = 1 , m_phyDefD = 0, m_phyDefU = 0 },
        [6 ] = { m_hp = 52 , m_mp = 32 , m_bagHeavy = 62 , m_roleHeavy = 17 , m_brawn = 15 , m_attackD = 1, m_attackU = 1 , m_phyDefD = 0, m_phyDefU = 0 },
        [7 ] = { m_hp = 60 , m_mp = 35 , m_bagHeavy = 66 , m_roleHeavy = 17 , m_brawn = 16 , m_attackD = 1, m_attackU = 1 , m_phyDefD = 0, m_phyDefU = 1 },
        [8 ] = { m_hp = 69 , m_mp = 39 , m_bagHeavy = 71 , m_roleHeavy = 18 , m_brawn = 17 , m_attackD = 1, m_attackU = 1 , m_phyDefD = 0, m_phyDefU = 1 },
        [9 ] = { m_hp = 79 , m_mp = 43 , m_bagHeavy = 77 , m_roleHeavy = 19 , m_brawn = 18 , m_attackD = 1, m_attackU = 1 , m_phyDefD = 0, m_phyDefU = 1 },
        [10] = { m_hp = 89 , m_mp = 46 , m_bagHeavy = 83 , m_roleHeavy = 20 , m_brawn = 20 , m_attackD = 1, m_attackU = 2 , m_phyDefD = 0, m_phyDefU = 1 },
        [11] = { m_hp = 100, m_mp = 49 , m_bagHeavy = 90 , m_roleHeavy = 21 , m_brawn = 21 , m_attackD = 1, m_attackU = 2 , m_phyDefD = 0, m_phyDefU = 1 },
        [12] = { m_hp = 111, m_mp = 53 , m_bagHeavy = 98 , m_roleHeavy = 22 , m_brawn = 23 , m_attackD = 1, m_attackU = 2 , m_phyDefD = 0, m_phyDefU = 1 },
        [13] = { m_hp = 123, m_mp = 57 , m_bagHeavy = 106, m_roleHeavy = 23 , m_brawn = 25 , m_attackD = 1, m_attackU = 2 , m_phyDefD = 0, m_phyDefU = 1 },
        [14] = { m_hp = 136, m_mp = 60 , m_bagHeavy = 115, m_roleHeavy = 25 , m_brawn = 27 , m_attackD = 1, m_attackU = 2 , m_phyDefD = 0, m_phyDefU = 2 },
        [15] = { m_hp = 149, m_mp = 63 , m_bagHeavy = 125, m_roleHeavy = 26 , m_brawn = 29 , m_attackD = 2, m_attackU = 3 , m_phyDefD = 0, m_phyDefU = 2 },
        [16] = { m_hp = 163, m_mp = 67 , m_bagHeavy = 135, m_roleHeavy = 28 , m_brawn = 32 , m_attackD = 2, m_attackU = 3 , m_phyDefD = 0, m_phyDefU = 2 },
        [17] = { m_hp = 177, m_mp = 71 , m_bagHeavy = 146, m_roleHeavy = 29 , m_brawn = 34 , m_attackD = 2, m_attackU = 3 , m_phyDefD = 0, m_phyDefU = 2 },
        [18] = { m_hp = 192, m_mp = 74 , m_bagHeavy = 158, m_roleHeavy = 31 , m_brawn = 37 , m_attackD = 2, m_attackU = 3 , m_phyDefD = 0, m_phyDefU = 2 },
        [19] = { m_hp = 208, m_mp = 77 , m_bagHeavy = 170, m_roleHeavy = 33 , m_brawn = 40 , m_attackD = 2, m_attackU = 3 , m_phyDefD = 0, m_phyDefU = 2 },
        [20] = { m_hp = 224, m_mp = 81 , m_bagHeavy = 183, m_roleHeavy = 35 , m_brawn = 43 , m_attackD = 3, m_attackU = 4 , m_phyDefD = 0, m_phyDefU = 2 },
        [21] = { m_hp = 241, m_mp = 85 , m_bagHeavy = 197, m_roleHeavy = 37 , m_brawn = 46 , m_attackD = 3, m_attackU = 4 , m_phyDefD = 0, m_phyDefU = 3 },
        [22] = { m_hp = 258, m_mp = 88 , m_bagHeavy = 211, m_roleHeavy = 39 , m_brawn = 49 , m_attackD = 3, m_attackU = 4 , m_phyDefD = 0, m_phyDefU = 3 },
        [23] = { m_hp = 276, m_mp = 91 , m_bagHeavy = 226, m_roleHeavy = 41 , m_brawn = 53 , m_attackD = 3, m_attackU = 4 , m_phyDefD = 0, m_phyDefU = 3 },
        [24] = { m_hp = 295, m_mp = 95 , m_bagHeavy = 242, m_roleHeavy = 44 , m_brawn = 56 , m_attackD = 3, m_attackU = 4 , m_phyDefD = 0, m_phyDefU = 3 },
        [25] = { m_hp = 314, m_mp = 99 , m_bagHeavy = 258, m_roleHeavy = 46 , m_brawn = 60 , m_attackD = 4, m_attackU = 5 , m_phyDefD = 0, m_phyDefU = 3 },
        [26] = { m_hp = 334, m_mp = 102, m_bagHeavy = 275, m_roleHeavy = 49 , m_brawn = 64 , m_attackD = 4, m_attackU = 5 , m_phyDefD = 0, m_phyDefU = 3 },
        [27] = { m_hp = 354, m_mp = 105, m_bagHeavy = 293, m_roleHeavy = 51 , m_brawn = 68 , m_attackD = 4, m_attackU = 5 , m_phyDefD = 0, m_phyDefU = 3 },
        [28] = { m_hp = 375, m_mp = 109, m_bagHeavy = 311, m_roleHeavy = 54 , m_brawn = 72 , m_attackD = 4, m_attackU = 5 , m_phyDefD = 0, m_phyDefU = 4 },
        [29] = { m_hp = 397, m_mp = 113, m_bagHeavy = 330, m_roleHeavy = 57 , m_brawn = 77 , m_attackD = 4, m_attackU = 5 , m_phyDefD = 0, m_phyDefU = 4 },
        [30] = { m_hp = 419, m_mp = 116, m_bagHeavy = 350, m_roleHeavy = 60 , m_brawn = 81 , m_attackD = 5, m_attackU = 6 , m_phyDefD = 0, m_phyDefU = 4 },
        [31] = { m_hp = 442, m_mp = 119, m_bagHeavy = 370, m_roleHeavy = 63 , m_brawn = 86 , m_attackD = 5, m_attackU = 6 , m_phyDefD = 0, m_phyDefU = 4 },
        [32] = { m_hp = 465, m_mp = 123, m_bagHeavy = 391, m_roleHeavy = 66 , m_brawn = 91 , m_attackD = 5, m_attackU = 6 , m_phyDefD = 0, m_phyDefU = 4 },
        [33] = { m_hp = 489, m_mp = 127, m_bagHeavy = 413, m_roleHeavy = 69 , m_brawn = 96 , m_attackD = 5, m_attackU = 6 , m_phyDefD = 0, m_phyDefU = 4 },
        [34] = { m_hp = 514, m_mp = 130, m_bagHeavy = 435, m_roleHeavy = 73 , m_brawn = 101, m_attackD = 5, m_attackU = 6 , m_phyDefD = 0, m_phyDefU = 4 },
        [35] = { m_hp = 539, m_mp = 133, m_bagHeavy = 458, m_roleHeavy = 76 , m_brawn = 106, m_attackD = 6, m_attackU = 7 , m_phyDefD = 0, m_phyDefU = 5 },
        [36] = { m_hp = 565, m_mp = 137, m_bagHeavy = 482, m_roleHeavy = 80 , m_brawn = 112, m_attackD = 6, m_attackU = 7 , m_phyDefD = 0, m_phyDefU = 5 },
        [37] = { m_hp = 591, m_mp = 141, m_bagHeavy = 506, m_roleHeavy = 83 , m_brawn = 117, m_attackD = 6, m_attackU = 7 , m_phyDefD = 0, m_phyDefU = 5 },
        [38] = { m_hp = 618, m_mp = 144, m_bagHeavy = 531, m_roleHeavy = 87 , m_brawn = 123, m_attackD = 6, m_attackU = 7 , m_phyDefD = 0, m_phyDefU = 5 },
        [39] = { m_hp = 646, m_mp = 147, m_bagHeavy = 557, m_roleHeavy = 91 , m_brawn = 129, m_attackD = 6, m_attackU = 7 , m_phyDefD = 0, m_phyDefU = 5 },
        [40] = { m_hp = 674, m_mp = 151, m_bagHeavy = 583, m_roleHeavy = 95 , m_brawn = 135, m_attackD = 7, m_attackU = 8 , m_phyDefD = 0, m_phyDefU = 5 },
        [41] = { m_hp = 703, m_mp = 155, m_bagHeavy = 610, m_roleHeavy = 99 , m_brawn = 141, m_attackD = 7, m_attackU = 8 , m_phyDefD = 0, m_phyDefU = 5 },
        [42] = { m_hp = 732, m_mp = 158, m_bagHeavy = 638, m_roleHeavy = 103, m_brawn = 148, m_attackD = 7, m_attackU = 8 , m_phyDefD = 0, m_phyDefU = 6 },
        [43] = { m_hp = 762, m_mp = 161, m_bagHeavy = 666, m_roleHeavy = 107, m_brawn = 154, m_attackD = 7, m_attackU = 8 , m_phyDefD = 0, m_phyDefU = 6 },
        [44] = { m_hp = 793, m_mp = 165, m_bagHeavy = 695, m_roleHeavy = 112, m_brawn = 161, m_attackD = 7, m_attackU = 8 , m_phyDefD = 0, m_phyDefU = 6 },
        [45] = { m_hp = 824, m_mp = 169, m_bagHeavy = 725, m_roleHeavy = 116, m_brawn = 168, m_attackD = 8, m_attackU = 9 , m_phyDefD = 0, m_phyDefU = 6 },
        [46] = { m_hp = 856, m_mp = 172, m_bagHeavy = 755, m_roleHeavy = 121, m_brawn = 175, m_attackD = 8, m_attackU = 9 , m_phyDefD = 0, m_phyDefU = 6 },
        [47] = { m_hp = 888, m_mp = 175, m_bagHeavy = 786, m_roleHeavy = 125, m_brawn = 182, m_attackD = 8, m_attackU = 9 , m_phyDefD = 0, m_phyDefU = 6 },
        [48] = { m_hp = 921, m_mp = 179, m_bagHeavy = 817, m_roleHeavy = 130, m_brawn = 190, m_attackD = 8, m_attackU = 9 , m_phyDefD = 0, m_phyDefU = 6 },
        [49] = { m_hp = 934, m_mp = 183, m_bagHeavy = 849, m_roleHeavy = 135, m_brawn = 198, m_attackD = 8, m_attackU = 9 , m_phyDefD = 0, m_phyDefU = 7 },
        [50] = { m_hp = 968, m_mp = 187, m_bagHeavy = 881, m_roleHeavy = 141, m_brawn = 207, m_attackD = 9, m_attackU = 10, m_phyDefD = 0, m_phyDefU = 7 } 
    },
    
    -- 法师
    [2] = {
    -- HP值 MP值 背包负重 负重量 腕力 攻击力 魔法力
        [1 ] = { m_hp = 16 , m_mp = 18 , m_bagHeavy = 50 , m_roleHeavy = 15, m_brawn = 12, m_attackD = 0, m_attackU = 1, m_magicD = 0, m_magicU = 1 },
        [2 ] = { m_hp = 18 , m_mp = 24 , m_bagHeavy = 51 , m_roleHeavy = 15, m_brawn = 12, m_attackD = 0, m_attackU = 1, m_magicD = 0, m_magicU = 1 },
        [3 ] = { m_hp = 20 , m_mp = 30 , m_bagHeavy = 52 , m_roleHeavy = 15, m_brawn = 12, m_attackD = 0, m_attackU = 1, m_magicD = 0, m_magicU = 1 },
        [4 ] = { m_hp = 22 , m_mp = 38 , m_bagHeavy = 53 , m_roleHeavy = 15, m_brawn = 12, m_attackD = 0, m_attackU = 1, m_magicD = 0, m_magicU = 1 },
        [5 ] = { m_hp = 25 , m_mp = 46 , m_bagHeavy = 55 , m_roleHeavy = 15, m_brawn = 12, m_attackD = 0, m_attackU = 1, m_magicD = 0, m_magicU = 1 },
        [6 ] = { m_hp = 27 , m_mp = 55 , m_bagHeavy = 57 , m_roleHeavy = 15, m_brawn = 12, m_attackD = 0, m_attackU = 1, m_magicD = 0, m_magicU = 1 },
        [7 ] = { m_hp = 30 , m_mp = 65 , m_bagHeavy = 60 , m_roleHeavy = 15, m_brawn = 13, m_attackD = 0, m_attackU = 1, m_magicD = 0, m_magicU = 1 },
        [8 ] = { m_hp = 33 , m_mp = 76 , m_bagHeavy = 63 , m_roleHeavy = 16, m_brawn = 13, m_attackD = 0, m_attackU = 1, m_magicD = 0, m_magicU = 1 },
        [9 ] = { m_hp = 36 , m_mp = 88 , m_bagHeavy = 66 , m_roleHeavy = 16, m_brawn = 13, m_attackD = 0, m_attackU = 1, m_magicD = 0, m_magicU = 1 },
        [10] = { m_hp = 39 , m_mp = 101 , m_bagHeavy = 70 , m_roleHeavy = 16, m_brawn = 13, m_attackD = 0, m_attackU = 1, m_magicD = 0, m_magicU = 1 },
        [11] = { m_hp = 42 , m_mp = 115 , m_bagHeavy = 74 , m_roleHeavy = 16, m_brawn = 13, m_attackD = 0, m_attackU = 1, m_magicD = 0, m_magicU = 1 },
        [12] = { m_hp = 45 , m_mp = 129 , m_bagHeavy = 79 , m_roleHeavy = 16, m_brawn = 14, m_attackD = 0, m_attackU = 1, m_magicD = 0, m_magicU = 1 },
        [13] = { m_hp = 49 , m_mp = 145 , m_bagHeavy = 84 , m_roleHeavy = 17, m_brawn = 14, m_attackD = 0, m_attackU = 1, m_magicD = 0, m_magicU = 1 },
        [14] = { m_hp = 52 , m_mp = 161 , m_bagHeavy = 89 , m_roleHeavy = 17, m_brawn = 14, m_attackD = 1, m_attackU = 2, m_magicD = 1, m_magicU = 2 },
        [15] = { m_hp = 56 , m_mp = 178 , m_bagHeavy = 95 , m_roleHeavy = 17, m_brawn = 14, m_attackD = 1, m_attackU = 2, m_magicD = 1, m_magicU = 2 },
        [16] = { m_hp = 60 , m_mp = 196 , m_bagHeavy = 101, m_roleHeavy = 18, m_brawn = 15, m_attackD = 1, m_attackU = 2, m_magicD = 1, m_magicU = 2 },
        [17] = { m_hp = 64 , m_mp = 215 , m_bagHeavy = 108, m_roleHeavy = 18, m_brawn = 15, m_attackD = 1, m_attackU = 2, m_magicD = 1, m_magicU = 2 },
        [18] = { m_hp = 68 , m_mp = 235 , m_bagHeavy = 115, m_roleHeavy = 18, m_brawn = 16, m_attackD = 1, m_attackU = 2, m_magicD = 1, m_magicU = 2 },
        [19] = { m_hp = 72 , m_mp = 255 , m_bagHeavy = 122, m_roleHeavy = 19, m_brawn = 16, m_attackD = 1, m_attackU = 2, m_magicD = 1, m_magicU = 2 },
        [20] = { m_hp = 77 , m_mp = 277 , m_bagHeavy = 130, m_roleHeavy = 19, m_brawn = 16, m_attackD = 1, m_attackU = 2, m_magicD = 1, m_magicU = 2 },
        [21] = { m_hp = 81 , m_mp = 299 , m_bagHeavy = 138, m_roleHeavy = 19, m_brawn = 17, m_attackD = 2, m_attackU = 3, m_magicD = 2, m_magicU = 3 },
        [22] = { m_hp = 86 , m_mp = 323 , m_bagHeavy = 147, m_roleHeavy = 20, m_brawn = 17, m_attackD = 2, m_attackU = 3, m_magicD = 2, m_magicU = 3 },
        [23] = { m_hp = 91 , m_mp = 347 , m_bagHeavy = 156, m_roleHeavy = 20, m_brawn = 18, m_attackD = 2, m_attackU = 3, m_magicD = 2, m_magicU = 3 },
        [24] = { m_hp = 96 , m_mp = 372 , m_bagHeavy = 165, m_roleHeavy = 21, m_brawn = 18, m_attackD = 2, m_attackU = 3, m_magicD = 2, m_magicU = 3 },
        [25] = { m_hp = 101, m_mp = 398 , m_bagHeavy = 175, m_roleHeavy = 21, m_brawn = 19, m_attackD = 2, m_attackU = 3, m_magicD = 2, m_magicU = 3 },
        [26] = { m_hp = 106, m_mp = 425 , m_bagHeavy = 185, m_roleHeavy = 22, m_brawn = 20, m_attackD = 2, m_attackU = 3, m_magicD = 2, m_magicU = 3 },
        [27] = { m_hp = 111, m_mp = 453 , m_bagHeavy = 196, m_roleHeavy = 22, m_brawn = 20, m_attackD = 2, m_attackU = 3, m_magicD = 2, m_magicU = 3 },
        [28] = { m_hp = 117, m_mp = 481 , m_bagHeavy = 207, m_roleHeavy = 23, m_brawn = 21, m_attackD = 3, m_attackU = 4, m_magicD = 3, m_magicU = 4 },
        [29] = { m_hp = 122, m_mp = 511 , m_bagHeavy = 218, m_roleHeavy = 23, m_brawn = 21, m_attackD = 3, m_attackU = 4, m_magicD = 3, m_magicU = 4 },
        [30] = { m_hp = 128, m_mp = 541 , m_bagHeavy = 230, m_roleHeavy = 24, m_brawn = 22, m_attackD = 3, m_attackU = 4, m_magicD = 3, m_magicU = 4 },
        [31] = { m_hp = 134, m_mp = 572 , m_bagHeavy = 242, m_roleHeavy = 25, m_brawn = 23, m_attackD = 3, m_attackU = 4, m_magicD = 3, m_magicU = 4 },
        [32] = { m_hp = 140, m_mp = 604 , m_bagHeavy = 255, m_roleHeavy = 25, m_brawn = 23, m_attackD = 3, m_attackU = 4, m_magicD = 3, m_magicU = 4 },
        [33] = { m_hp = 146, m_mp = 637 , m_bagHeavy = 268, m_roleHeavy = 26, m_brawn = 24, m_attackD = 3, m_attackU = 4, m_magicD = 3, m_magicU = 4 },
        [34] = { m_hp = 152, m_mp = 671 , m_bagHeavy = 281, m_roleHeavy = 27, m_brawn = 25, m_attackD = 3, m_attackU = 4, m_magicD = 3, m_magicU = 4 },
        [35] = { m_hp = 159, m_mp = 706 , m_bagHeavy = 295, m_roleHeavy = 27, m_brawn = 26, m_attackD = 4, m_attackU = 5, m_magicD = 4, m_magicU = 5 },
        [36] = { m_hp = 165, m_mp = 742 , m_bagHeavy = 309, m_roleHeavy = 28, m_brawn = 26, m_attackD = 4, m_attackU = 5, m_magicD = 4, m_magicU = 5 },
        [37] = { m_hp = 172, m_mp = 778 , m_bagHeavy = 324, m_roleHeavy = 29, m_brawn = 27, m_attackD = 4, m_attackU = 5, m_magicD = 4, m_magicU = 5 },
        [38] = { m_hp = 179, m_mp = 816 , m_bagHeavy = 339, m_roleHeavy = 29, m_brawn = 28, m_attackD = 4, m_attackU = 5, m_magicD = 4, m_magicU = 5 },
        [39] = { m_hp = 186, m_mp = 854 , m_bagHeavy = 354, m_roleHeavy = 30, m_brawn = 29, m_attackD = 4, m_attackU = 5, m_magicD = 4, m_magicU = 5 },
        [40] = { m_hp = 193, m_mp = 893 , m_bagHeavy = 370, m_roleHeavy = 31, m_brawn = 30, m_attackD = 4, m_attackU = 5, m_magicD = 4, m_magicU = 5 },
        [41] = { m_hp = 200, m_mp = 933 , m_bagHeavy = 386, m_roleHeavy = 32, m_brawn = 31, m_attackD = 4, m_attackU = 5, m_magicD = 4, m_magicU = 5 },
        [42] = { m_hp = 207, m_mp = 974 , m_bagHeavy = 403, m_roleHeavy = 33, m_brawn = 32, m_attackD = 5, m_attackU = 6, m_magicD = 5, m_magicU = 6 },
        [43] = { m_hp = 215, m_mp = 1016 , m_bagHeavy = 420, m_roleHeavy = 33, m_brawn = 33, m_attackD = 5, m_attackU = 6, m_magicD = 5, m_magicU = 6 },
        [44] = { m_hp = 222, m_mp = 1058 , m_bagHeavy = 437, m_roleHeavy = 34, m_brawn = 34, m_attackD = 5, m_attackU = 6, m_magicD = 5, m_magicU = 6 },
        [45] = { m_hp = 230, m_mp = 1102 , m_bagHeavy = 455, m_roleHeavy = 35, m_brawn = 34, m_attackD = 5, m_attackU = 6, m_magicD = 5, m_magicU = 6 },
        [46] = { m_hp = 238, m_mp = 1146 , m_bagHeavy = 473, m_roleHeavy = 36, m_brawn = 36, m_attackD = 5, m_attackU = 6, m_magicD = 5, m_magicU = 6 },
        [47] = { m_hp = 246, m_mp = 1192 , m_bagHeavy = 492, m_roleHeavy = 37, m_brawn = 37, m_attackD = 5, m_attackU = 6, m_magicD = 5, m_magicU = 6 },
        [48] = { m_hp = 254, m_mp = 1238 , m_bagHeavy = 511, m_roleHeavy = 38, m_brawn = 38, m_attackD = 5, m_attackU = 6, m_magicD = 5, m_magicU = 6 },
        [49] = { m_hp = 262, m_mp = 1284 , m_bagHeavy = 530, m_roleHeavy = 39, m_brawn = 39, m_attackD = 6, m_attackU = 7, m_magicD = 6, m_magicU = 7 },
        [50] = { m_hp = 271, m_mp = 1333 , m_bagHeavy = 549, m_roleHeavy = 40, m_brawn = 40, m_attackD = 6, m_attackU = 7, m_magicD = 6, m_magicU = 7 }
    
    },
    
    -- 道士
    [3] = {
    -- HP值 MP值 背包负重 负重量 腕力 攻击力 道术力 魔御力
        [1 ] = { m_hp = 17 , m_mp = 13 , m_bagHeavy = 50 , m_roleHeavy = 15, m_brawn = 12, m_attackD = 0, m_attackU = 1, m_taoistD = 0, m_taoistU = 1, m_magDefD = 0, m_magDefU = 1 },
        [2 ] = { m_hp = 20 , m_mp = 14 , m_bagHeavy = 51 , m_roleHeavy = 15, m_brawn = 12, m_attackD = 0, m_attackU = 1, m_taoistD = 0, m_taoistU = 1, m_magDefD = 0, m_magDefU = 1 },
        [3 ] = { m_hp = 23 , m_mp = 15 , m_bagHeavy = 52 , m_roleHeavy = 15, m_brawn = 12, m_attackD = 0, m_attackU = 1, m_taoistD = 0, m_taoistU = 1, m_magDefD = 0, m_magDefU = 1 },
        [4 ] = { m_hp = 27 , m_mp = 17 , m_bagHeavy = 54 , m_roleHeavy = 15, m_brawn = 12, m_attackD = 0, m_attackU = 1, m_taoistD = 0, m_taoistU = 1, m_magDefD = 0, m_magDefU = 2 },
        [5 ] = { m_hp = 31 , m_mp = 20 , m_bagHeavy = 56 , m_roleHeavy = 15, m_brawn = 13, m_attackD = 0, m_attackU = 1, m_taoistD = 0, m_taoistU = 1, m_magDefD = 0, m_magDefU = 2 },
        [6 ] = { m_hp = 35 , m_mp = 23 , m_bagHeavy = 59 , m_roleHeavy = 16, m_brawn = 13, m_attackD = 0, m_attackU = 1, m_taoistD = 0, m_taoistU = 1, m_magDefD = 0, m_magDefU = 2 },
        [7 ] = { m_hp = 40 , m_mp = 26 , m_bagHeavy = 62 , m_roleHeavy = 16, m_brawn = 13, m_attackD = 0, m_attackU = 1, m_taoistD = 0, m_taoistU = 1, m_magDefD = 0, m_magDefU = 2 },
        [8 ] = { m_hp = 45 , m_mp = 31 , m_bagHeavy = 66 , m_roleHeavy = 16, m_brawn = 14, m_attackD = 0, m_attackU = 1, m_taoistD = 0, m_taoistU = 1, m_magDefD = 0, m_magDefU = 2 },
        [9 ] = { m_hp = 50 , m_mp = 35 , m_bagHeavy = 70 , m_roleHeavy = 17, m_brawn = 14, m_attackD = 0, m_attackU = 1, m_taoistD = 0, m_taoistU = 1, m_magDefD = 1, m_magDefU = 3 },
        [10] = { m_hp = 56 , m_mp = 41 , m_bagHeavy = 75 , m_roleHeavy = 17, m_brawn = 14, m_attackD = 0, m_attackU = 1, m_taoistD = 0, m_taoistU = 1, m_magDefD = 1, m_magDefU = 3 },
        [11] = { m_hp = 62 , m_mp = 46 , m_bagHeavy = 80 , m_roleHeavy = 17, m_brawn = 15, m_attackD = 0, m_attackU = 1, m_taoistD = 0, m_taoistU = 1, m_magDefD = 1, m_magDefU = 3 },
        [12] = { m_hp = 68 , m_mp = 53 , m_bagHeavy = 86 , m_roleHeavy = 18, m_brawn = 15, m_attackD = 0, m_attackU = 1, m_taoistD = 0, m_taoistU = 1, m_magDefD = 1, m_magDefU = 3 },
        [13] = { m_hp = 75 , m_mp = 59 , m_bagHeavy = 92 , m_roleHeavy = 18, m_brawn = 16, m_attackD = 0, m_attackU = 1, m_taoistD = 0, m_taoistU = 1, m_magDefD = 1, m_magDefU = 3 },
        [14] = { m_hp = 82 , m_mp = 67 , m_bagHeavy = 99 , m_roleHeavy = 19, m_brawn = 17, m_attackD = 1, m_attackU = 2, m_taoistD = 1, m_taoistU = 2, m_magDefD = 1, m_magDefU = 3 },
        [15] = { m_hp = 89 , m_mp = 75 , m_bagHeavy = 106, m_roleHeavy = 19, m_brawn = 17, m_attackD = 1, m_attackU = 2, m_taoistD = 1, m_taoistU = 2, m_magDefD = 1, m_magDefU = 3 },
        [16] = { m_hp = 97 , m_mp = 83 , m_bagHeavy = 114, m_roleHeavy = 20, m_brawn = 18, m_attackD = 1, m_attackU = 2, m_taoistD = 1, m_taoistU = 2, m_magDefD = 1, m_magDefU = 4 },
        [17] = { m_hp = 105, m_mp = 92 , m_bagHeavy = 122, m_roleHeavy = 21, m_brawn = 19, m_attackD = 1, m_attackU = 2, m_taoistD = 1, m_taoistU = 2, m_magDefD = 1, m_magDefU = 4 },
        [18] = { m_hp = 113, m_mp = 102 , m_bagHeavy = 131, m_roleHeavy = 21, m_brawn = 20, m_attackD = 1, m_attackU = 2, m_taoistD = 1, m_taoistU = 2, m_magDefD = 1, m_magDefU = 4 },
        [19] = { m_hp = 122, m_mp = 112 , m_bagHeavy = 140, m_roleHeavy = 22, m_brawn = 21, m_attackD = 1, m_attackU = 2, m_taoistD = 1, m_taoistU = 2, m_magDefD = 1, m_magDefU = 4 },
        [20] = { m_hp = 131, m_mp = 123 , m_bagHeavy = 150, m_roleHeavy = 23, m_brawn = 22, m_attackD = 1, m_attackU = 2, m_taoistD = 1, m_taoistU = 2, m_magDefD = 1, m_magDefU = 4 },
        [21] = { m_hp = 140, m_mp = 134 , m_bagHeavy = 160, m_roleHeavy = 24, m_brawn = 22, m_attackD = 2, m_attackU = 3, m_taoistD = 2, m_taoistU = 3, m_magDefD = 2, m_magDefU = 5 },
        [22] = { m_hp = 150, m_mp = 146 , m_bagHeavy = 171, m_roleHeavy = 25, m_brawn = 24, m_attackD = 2, m_attackU = 3, m_taoistD = 2, m_taoistU = 3, m_magDefD = 2, m_magDefU = 5 },
        [23] = { m_hp = 160, m_mp = 158 , m_bagHeavy = 182, m_roleHeavy = 26, m_brawn = 25, m_attackD = 2, m_attackU = 3, m_taoistD = 2, m_taoistU = 3, m_magDefD = 2, m_magDefU = 5 },
        [24] = { m_hp = 170, m_mp = 171 , m_bagHeavy = 194, m_roleHeavy = 27, m_brawn = 26, m_attackD = 2, m_attackU = 3, m_taoistD = 2, m_taoistU = 3, m_magDefD = 2, m_magDefU = 5 },
        [25] = { m_hp = 181, m_mp = 185 , m_bagHeavy = 206, m_roleHeavy = 27, m_brawn = 27, m_attackD = 2, m_attackU = 3, m_taoistD = 2, m_taoistU = 3, m_magDefD = 2, m_magDefU = 5 },
        [26] = { m_hp = 192, m_mp = 199 , m_bagHeavy = 219, m_roleHeavy = 29, m_brawn = 28, m_attackD = 2, m_attackU = 3, m_taoistD = 2, m_taoistU = 3, m_magDefD = 2, m_magDefU = 5 },
        [27] = { m_hp = 203, m_mp = 214 , m_bagHeavy = 232, m_roleHeavy = 30, m_brawn = 29, m_attackD = 2, m_attackU = 3, m_taoistD = 2, m_taoistU = 3, m_magDefD = 2, m_magDefU = 5 },
        [28] = { m_hp = 215, m_mp = 229 , m_bagHeavy = 246, m_roleHeavy = 31, m_brawn = 31, m_attackD = 3, m_attackU = 4, m_taoistD = 3, m_taoistU = 4, m_magDefD = 2, m_magDefU = 6 },
        [29] = { m_hp = 227, m_mp = 244 , m_bagHeavy = 260, m_roleHeavy = 32, m_brawn = 32, m_attackD = 3, m_attackU = 4, m_taoistD = 3, m_taoistU = 4, m_magDefD = 2, m_magDefU = 6 },
        [30] = { m_hp = 239, m_mp = 261 , m_bagHeavy = 275, m_roleHeavy = 33, m_brawn = 33, m_attackD = 3, m_attackU = 4, m_taoistD = 3, m_taoistU = 4, m_magDefD = 2, m_magDefU = 6 },
        [31] = { m_hp = 252, m_mp = 277 , m_bagHeavy = 290, m_roleHeavy = 34, m_brawn = 35, m_attackD = 3, m_attackU = 4, m_taoistD = 3, m_taoistU = 4, m_magDefD = 2, m_magDefU = 6 },
        [32] = { m_hp = 265, m_mp = 295 , m_bagHeavy = 306, m_roleHeavy = 35, m_brawn = 36, m_attackD = 3, m_attackU = 4, m_taoistD = 3, m_taoistU = 4, m_magDefD = 2, m_magDefU = 6 },
        [33] = { m_hp = 278, m_mp = 312 , m_bagHeavy = 322, m_roleHeavy = 37, m_brawn = 38, m_attackD = 3, m_attackU = 4, m_taoistD = 3, m_taoistU = 4, m_magDefD = 3, m_magDefU = 7 },
        [34] = { m_hp = 292, m_mp = 331 , m_bagHeavy = 339, m_roleHeavy = 38, m_brawn = 40, m_attackD = 3, m_attackU = 4, m_taoistD = 3, m_taoistU = 4, m_magDefD = 3, m_magDefU = 7 },
        [35] = { m_hp = 306, m_mp = 350 , m_bagHeavy = 356, m_roleHeavy = 39, m_brawn = 41, m_attackD = 4, m_attackU = 5, m_taoistD = 4, m_taoistU = 5, m_magDefD = 3, m_magDefU = 7 },
        [36] = { m_hp = 320, m_mp = 369 , m_bagHeavy = 374, m_roleHeavy = 41, m_brawn = 43, m_attackD = 4, m_attackU = 5, m_taoistD = 4, m_taoistU = 5, m_magDefD = 3, m_magDefU = 7 },
        [37] = { m_hp = 335, m_mp = 389 , m_bagHeavy = 392, m_roleHeavy = 42, m_brawn = 45, m_attackD = 4, m_attackU = 5, m_taoistD = 4, m_taoistU = 5, m_magDefD = 3, m_magDefU = 7 },
        [38] = { m_hp = 350, m_mp = 410 , m_bagHeavy = 411, m_roleHeavy = 44, m_brawn = 46, m_attackD = 4, m_attackU = 5, m_taoistD = 4, m_taoistU = 5, m_magDefD = 3, m_magDefU = 7 },
        [39] = { m_hp = 365, m_mp = 431 , m_bagHeavy = 430, m_roleHeavy = 45, m_brawn = 48, m_attackD = 4, m_attackU = 5, m_taoistD = 4, m_taoistU = 5, m_magDefD = 3, m_magDefU = 7 },
        [40] = { m_hp = 381, m_mp = 453 , m_bagHeavy = 450, m_roleHeavy = 47, m_brawn = 50, m_attackD = 4, m_attackU = 5, m_taoistD = 4, m_taoistU = 5, m_magDefD = 3, m_magDefU = 8 },
        [41] = { m_hp = 397, m_mp = 475 , m_bagHeavy = 470, m_roleHeavy = 49, m_brawn = 52, m_attackD = 4, m_attackU = 5, m_taoistD = 4, m_taoistU = 5, m_magDefD = 3, m_magDefU = 8 },
        [42] = { m_hp = 413, m_mp = 498 , m_bagHeavy = 491, m_roleHeavy = 50, m_brawn = 54, m_attackD = 5, m_attackU = 6, m_taoistD = 5, m_taoistU = 6, m_magDefD = 3, m_magDefU = 8 },
        [43] = { m_hp = 430, m_mp = 521 , m_bagHeavy = 512, m_roleHeavy = 52, m_brawn = 56, m_attackD = 5, m_attackU = 6, m_taoistD = 5, m_taoistU = 6, m_magDefD = 3, m_magDefU = 8 },
        [44] = { m_hp = 447, m_mp = 545 , m_bagHeavy = 534, m_roleHeavy = 54, m_brawn = 58, m_attackD = 5, m_attackU = 6, m_taoistD = 5, m_taoistU = 6, m_magDefD = 3, m_magDefU = 8 },
        [45] = { m_hp = 464, m_mp = 570 , m_bagHeavy = 556, m_roleHeavy = 56, m_brawn = 60, m_attackD = 5, m_attackU = 6, m_taoistD = 5, m_taoistU = 6, m_magDefD = 4, m_magDefU = 9 },
        [46] = { m_hp = 482, m_mp = 595 , m_bagHeavy = 579, m_roleHeavy = 57, m_brawn = 62, m_attackD = 5, m_attackU = 6, m_taoistD = 5, m_taoistU = 6, m_magDefD = 4, m_magDefU = 9 },
        [47] = { m_hp = 500, m_mp = 620 , m_bagHeavy = 602, m_roleHeavy = 59, m_brawn = 64, m_attackD = 5, m_attackU = 6, m_magicD = 5, m_taoistU = 6, m_magDefD = 4, m_magDefU = 9 },
        [48] = { m_hp = 518, m_mp = 646 , m_bagHeavy = 626, m_roleHeavy = 61, m_brawn = 66, m_attackD = 5, m_attackU = 6, m_magicD = 5, m_taoistU = 6, m_magDefD = 4, m_magDefU = 9 },
        [49] = { m_hp = 537, m_mp = 672 , m_bagHeavy = 650, m_roleHeavy = 63, m_brawn = 69, m_attackD = 6, m_attackU = 7, m_magicD = 6, m_taoistU = 7, m_magDefD = 4, m_magDefU = 9 },
        [50] = { m_hp = 556, m_mp = 699 , m_bagHeavy = 675, m_roleHeavy = 64, m_brawn = 70, m_attackD = 6, m_attackU = 7, m_magicD = 6, m_taoistU = 7, m_magDefD = 4, m_magDefU = 9 }
    }
}
