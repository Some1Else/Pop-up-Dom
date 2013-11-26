ActiveAdmin.register Product do
  config.filters = false
  config.paginate = false

  index do
    column "Name", :sortable => :name do |c|
      link_to c.name, admin_product_path(c)
    end
    column :description do |c|
      para c.description.truncate(100)
    end
    column :price

    actions defaults: false do |c|
      link_to 'Edit', edit_admin_product_path(c)
    end
    actions defaults: false do |c|
      link_to 'Delete', admin_product_path(c), :method => 'delete'
    end
  end

  # SHOW

  show do |product|
    attributes_table do
      row :name
      row "Product Author" do
        product.product_author.name
      end
      row :description
      row :product_category do
        product.product_category.name
      end
      row :price

      unless product.product_images.empty?
        row "Product Images" do
          o = ''
          product.product_images.each do |image|
            o += image_tag(image.file.url, :style => 'height: 200px;')
            o += '<br>'
            
            unless image.first?
              o += link_to('To top', move_to_top_admin_product_image_path(image), :method => 'put', :class => 'button')
            end
            if image.higher_item
              o += link_to('Higher', move_higher_admin_product_image_path(image), :method => 'put', :class => 'button')
            end
            if image.lower_item
              o += link_to('Lower', move_lower_admin_product_image_path(image), :method => 'put', :class => 'button')
            end
            unless image.last?
              o += link_to('To bottom', move_to_bottom_admin_product_image_path(image), :method => 'put', :class => 'button')
            end
            o += '<br>'
            o += '<br>'
          end
          raw o
        end
      end
    end
  end

  # FORM

  form do |f|

    f.inputs "Info" do
      f.input :product_author_id, :as => :select, :collection => ProductAuthor.all.map {|c| [c.name, c.id]}, :include_blank => false
      f.input :product_category_id, :as => :select, :collection => ProductCategory.all.map {|c| [c.name, c.id]}, :include_blank => false

      f.input :name
      f.input :description
      f.input :price
    end

    f.inputs "Images" do
      f.has_many :product_images do |img_form|
      
          img_form.input :_destroy, :as => :boolean, :required => false, :label => 'Delete image' if !img_form.object.nil? && !img_form.object.new_record? 
          
          if !img_form.object.nil? and !img_form.object.file.nil?
            img_form.input :file, :as => :file, :hint => img_form.template.image_tag(img_form.object.file, :style => 'height: 100px;')
          else
            img_form.input :file, :as => :file
        end
      end
    end

    f.actions

  end
end
