class FetchFieldOfWorks < ActiveRecord::Migration
  def change
  	FieldOfWork.create([
  		{title: 'Cívil'},
  		{title: 'Trabalho'},
  		{title: 'Contratual'},
  		{title: 'Empresarial'},
  		{title: 'Tributário'},
  		{title: 'Comercial'},
  		{title: 'Tecnologia de Informação'},
  		{title: 'Outros'}
	])
  end
end
