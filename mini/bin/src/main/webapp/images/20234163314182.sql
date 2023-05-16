select a.recipe_no, recipe_name, count(a.recipe_no)
from t4_recipe a
left join t4_ingredient b on a.recipe_no = b.recipe_no
where ingredient = '양파' or ingredient = '계란'
group by a.recipe_no, recipe_name
having count(a.recipe_no) = 2