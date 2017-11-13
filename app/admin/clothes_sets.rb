ActiveAdmin.register ClothesSet do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  permit_params :name, :style_id, :size_id, :stock_status_id, :photo_URL, :points

  index do
    selectable_column
    id_column
    column :name
    column :style
    column :size
    column :stock_status
    column :photo_URL
    column :points
    actions
  end

  filter :style
  filter :size
  filter :stock_status

end
