```ruby
class TranslationsController < ApplicationController
  before_action :set_tenant
  before_action :set_translation, only: [:show, :edit, :update, :destroy]

  def index
    @translations = @tenant.translations
  end

  def show
  end

  def new
    @translation = @tenant.translations.build
  end

  def edit
  end

  def create
    @translation = @tenant.translations.build(translation_params)

    if @translation.save
      redirect_to [@tenant, @translation], notice: 'Translation was successfully created.'
    else
      render :new
    end
  end

  def update
    if @translation.update(translation_params)
      redirect_to [@tenant, @translation], notice: 'Translation was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @translation.destroy
    redirect_to tenant_translations_url(@tenant), notice: 'Translation was successfully destroyed.'
  end

  private
    def set_tenant
      @tenant = Tenant.find(params[:tenant_id])
    end

    def set_translation
      @translation = @tenant.translations.find(params[:id])
    end

    def translation_params
      params.require(:translation).permit(:source_language, :target_languages, :gettext_file, :yaml_file)
    end
end
```