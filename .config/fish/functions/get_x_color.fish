# # get color from xrdb with color number argument
# function get_x_color 
#  echo (xrdb -query | grep "\*\.$argv[1]\b" | cut -f2)
# end
