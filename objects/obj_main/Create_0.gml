randomize();
//crear inv
global.inv = ds_list_create();

//enum de items
enum item{
	diamond,
	pizza,
	potion,
	sword
}

//numero de items
globalvar item_num;
item_num = 4;

//sprites de items
globalvar item_spr;
item_spr[item.diamond] = spr_diamond;
item_spr[item.pizza] = spr_pizza;
item_spr[item.potion] = spr_potion;
item_spr[item.sword] = spr_sword;



fade_surf = -1;
fade_alpha = 0;


lives = 3;
globalvar coins;
coins = 0;
