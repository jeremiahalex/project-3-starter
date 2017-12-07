ActiveAdmin.register LoanedItem do
  # RENAME MENU
  menu label: " Loaned List "

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

  permit_params :loan_status_id, :date_of_submission

  index do
    selectable_column
    id_column
    column :user_id
    column :clothes_set_id
    column :loan_status
    column :created_at
    actions
  end

  filter :user
  filter :clothes_set
  filter :loan_status
  filter :created_at

  form do |f|
  f.inputs "Loan Details" do
    f.input :user
    f.input :clothes_set
    f.input :loan_status
  end
  f.actions
  end

end
