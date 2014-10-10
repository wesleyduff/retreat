class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]
  before_action :get_cabins, only: [:edit, :update, :new]
  before_action :get_roles, only: [:edit, :update, :new]
  before_action :get_genders, only: [:edit, :update, :new]
  before_action :get_families, only: [:edit, :update, :new]
  # GET /people
  # GET /people.json
  def index
    @people = Person.all
  end

  # GET /people/1
  # GET /people/1.json
  def show
  end

  # GET /people/new
  def new
    @person = Person.new
  end

  # GET /people/1/edit
  def edit
  end

  # POST /people
  # POST /people.json
  def create
    @person = Person.new(person_params)
    cabin = Cabin.find(@person.cabin_id);
    if(cabin.people_count < cabin.max)
      cabin.people_count = cabin.people_count + 1;
      if cabin.save
        flash[:notice] = "& person saved to cabin"
      else 
        @person.cabin_id = nil;
        flash[:notice] = "but the person could not be added to this cabin. Check the cabin and try again."
      end
    else 
      @person.cabin_id = nil;
      flash[:notice] = "but the cabin was full"
    end
    respond_to do |format|
      if @person.save
        format.html { redirect_to @person, notice: "Person saved successfully" + notice}
        format.json { render action: 'show', status: :created, location: @person }
      else
        format.html { render action: 'new' }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people/1
  # PATCH/PUT /people/1.json
  def update
    respond_to do |format|
      cabin = Cabin.find(@person.cabin_id);
      if(cabin.people_count < cabin.max)
        cabin.people_count = cabin.people_count + 1;
        if cabin.save
          flash[:notice] = "& person saved to cabin"
        else 
          @person.cabin_id = nil;
          flash[:notice] = "but the person could not be added to this cabin. Check the cabin and try again."
        end
      else 
        @person.cabin_id = nil;
        flash[:notice] = "but the cabin was full"
      end
      if @person.update(person_params)
        format.html { redirect_to @person, notice: 'Person was successfully updated' + notice }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    @person.destroy
    respond_to do |format|
      format.html { redirect_to people_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions
    def check_cabin_and_assing_if_available(person)
      cabin = Cabin.find(person.cabin_id);
      if(cabin.people_count < cabin.max)
        cabin.people_count = cabin.people_count + 1;
        if cabin.save
          flash[:notice] = "& person saved to cabin"
        else 
          person.cabin_id = nil;
          flash[:notice] = "but the person could not be added to this cabin. Check the cabin and try again."
        end
      else 
        person.cabin_id = nil;
        flash[:notice] = "but the cabin was full"
      end
      
    end
    def get_families 
      @fams = [['None selected', 0]]
      familiesList = Family.all
      familiesList.each do |fam|
        @fams.push([fam.name, fam.id])
      end
    end
    def get_genders 
      @genders = [['Male', 'male'], ['Female', 'female']]
    end
    def get_cabins
      @cabins = [['None selected', 0]]
      cabinList = Cabin.all.where(["people_count < max"]) #only show cabin that are not full
      unless(cabinList.empty?) #add each cabin to the list if there is a cabin in our returned array
        cabinList.each do |cabin|
          @cabins.push([cabin.name, cabin.id])
        end
      end
    end
    def get_roles
      @roles = [['None selected', 0]]
      rolesList = Role.all
      rolesList.each do |role|
        @roles.push([role.title, role.id])
      end
    end
    
    def set_person
      @person = Person.find(params[:id])
    end
   
    # Never trust parameters from the scary internet, only allow the white list through.
    def person_params
      params.require(:person).permit(:name, :lastname, :firstname, :gender, :age, :family_id, :cabin_id, :role_id)
    end
end
