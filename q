
[1mFrom:[0m /vagrant/nova_medio/nova_medio/app/views/admin/products/new.html.erb @ line 31 ActionView::CompiledTemplates#_app_views_admin_products_new_html_erb___4230365455823389401_47426185128060:

    [1;34m26[0m:   <div class="disc">
    [1;34m27[0m:   <h4>曲名</h4>
    [1;34m28[0m: 
    [1;34m29[0m:     <%= product.fields_for :discs do |discs| %>
    [1;34m30[0m:               <% binding.pry %>
 => [1;34m31[0m:       <%= render 'admin/products/nestform/disc_fields', disc: discs %>
    [1;34m32[0m:     <% end %>
    [1;34m33[0m:     <div class="links">
    [1;34m34[0m:       <%= link_to_add_association "discを追加", product, :discs, partial: "admin/products/nestform/disc_fields" %>
    [1;34m35[0m:     </div>
    [1;34m36[0m:   </div>

