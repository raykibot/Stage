package com.luo.type.constants;

public class Commons {


    // 延迟交换机
    public static final String DELAY_EXCHANGE = "delay_change";
    // 死信交换机
    public static final String DEAD_LETTER_EXCHANGE = "dead_letter_exchange";
    // 延迟队列
    public static final String DELAY_QUEUE = "delay_queue";
    // 死信队列
    public static final String DEAD_LETTER_QUEUE = "dead_letter_queue" ;

    // 延迟队列路由键
    public static final String DELAY_ROUTING_KEY = "delay_routing_key";
    public static final String DEAD_LETTER_ROUTING_KEY = "dead_letter_routing_key";


    public static  final String UNDERLINE = "_";
    public static final String SPACE = " ";
    public static final String COLON = ":";
    public static final String COMMA = ",";


    public static class RedisKey {
        public static final String STRATEGY_AWARD_COUNT_KEY = "strategy_award_count_key_";
        public static final String STRATEGY_AWARD_RATE_RANGE_KEY = "strategy_award_rate_range_key_";
        public static final String STRATEGY_AWARD_RATE_TABLE_KEY = "strategy_award_rate_table_key_";
        public static final String STRATEGY_AWARD_LIST_KEY = "strategy_award_list_key_";


        public static final String STRATEGY_AWARD_KEY = "strategy_award_key_";


        public static final String RULE_TREE_VO_KEY = "rule_tree_vo_key_";

        public static final String STRATEGY_AWARD_QUERY_KEY = "strategy_award_query_key_";



        public static final String ACTIVITY_COUNT_KEY = "activity_count_key_";
        public static final String ACTIVITY_KEY = "activity_key_";
        public static final String ACTIVITY_SKU_STOCK_COUNT_KEY = "activity_sku_stock_count_key_";
        public static final String ACTIVITY_SKU_COUNT_QUERY_KEY = "activity_sku_count_query_key_";


    }

}
