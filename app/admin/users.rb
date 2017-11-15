ActiveAdmin.register User do
  menu label: " User Details "
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
actions :all, except: [:new]

permit_params :points, :subscription_type

  index do
    selectable_column
    id_column
    column :name
    column :email
    column :points
    column :phone
    column :street
    column :unit
    column :postalcode
    column :subscription_type
    actions
  end

  filter :child
  filter :clothes_set
  filter :loaned_item
  filter :cart_item
  filter :stock_status
  filter :subscription_type

  form do |f|
  f.inputs "Users Details" do
    f.input :points
    f.input :subscription_type
  end
  f.actions
  end
end
