RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.model 'User' do
    list do
      field :email do
        label 'Usuario'
      end
      field :last_sign_in_at do
        label 'Última Sesión'
      end
    end

    exclude_fields :created_at, :updated_at, :reset_password_sent_at, :remember_created_at, :sign_in_count, 
                  :current_sign_in_at, :last_sign_in_at, :current_sign_in_ip, :last_sign_in_ip
  end


  config.model 'Organization' do
    list do
      field :code do
        label 'Código'
      end
      field :name do
        label 'Nombre'
      end
      field :collection_centers do
        label 'Centros de acopio'
      end
    end

    exclude_fields :created_at, :updated_at
  end

 config.model 'GeneticMaterial' do
    list do
      
      field :name do
        label 'Nombre'
      end
    end

    exclude_fields :created_at, :updated_at
  end

 config.model 'EntryControl' do
    list do
      
      field :entryDate do
        label 'Fecha de Entrada'
      end
      field :exchangeRate do
        label 'Tasa de Cambio'
      end

      field :receivedBy do
        label 'Recibido Por'
      end
      
      field :deliveredBy do
        label 'Enviado Por'
      end
      
      field :organization do
        label 'Organización'
      end
    end

    exclude_fields :created_at, :updated_at
  end

   config.model 'CollectionCenter' do
    list do
      
      field :code do
        label 'Código'
      end
      field :name do
        label 'Nombre'
      end
      field :organization do
        label 'Organización'
      end
    end

    exclude_fields :created_at, :updated_at
  end

  config.model 'CocoaType' do
    list do
      
      field :name do
        label 'Nombre'
      end
    end

    exclude_fields :created_at, :updated_at
  end

  config.model 'Category' do
    list do
      
      field :name do
        label 'Nombre'
      end
      field :place do
        label 'Lugar'
      end
      field :runs do
        label 'Ejecución'
      end
    end

    exclude_fields :created_at, :updated_at
  end

    config.model 'Acceptance' do
    list do
      
      field :max_qualityA do
        label 'Máxima calidad A'
      end
      field :max_qualityB do
        label 'Máxima calidad B'
      end
      field :max_qualityC do
        label 'Máxima calidad C'
      end
      field :min_qualityA do
        label 'Mínima calidad A'
      end
      field :min_qualityB do
        label 'Mínima calidad B'
      end
      field :min_qualityC do
        label 'Mínima calidad C'
      end
      field :parameter_id do
        label 'Parámetro'
      end      
    end

    exclude_fields :created_at, :updated_at
  end

  config.model 'Parameter' do
    list do
      
      field :name do
        label 'Nombre'
      end
      field :unit do
        label 'Unidad'
      end
      field :place do
        label 'Lugar'
      end
      field :category do
        label 'Categoria'
      end
    end

    exclude_fields :created_at, :updated_at
  end

  config.model 'Batch' do
    list do
      
      field :sackAmount do
        label 'Cantidad de Sacos'
      end
      field :weight do
        label 'Peso en Libras'
      end
      field :enterCode do
        label 'Código'
      end
      field :cocoaType do
        label 'Tipo de Cacao'
      end
      field :geneticMaterial do
        label 'Material Genético'
      end
      field :entry_control do
        label 'Control de Calidad'
      end                  
    end

    exclude_fields :created_at, :updated_at
  end
  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    #export
    bulk_delete
    show
    edit
    delete
    #show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)
  config.parent_controller = 'ApplicationController'
  config.excluded_models << Batch
  config.excluded_models << EntryControl
  config.excluded_models << Notification
  config.excluded_models << QualityControl
  config.excluded_models << Result
  config.excluded_models << Revision
end
