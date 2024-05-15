class ProjectsController < ApplicationController
    
    def index
        @projects = Project.all
    end
    
    def new
        @project = Project.new
    end

    def create
        @project = current_user.projects.new(project_params)
        if @project.save
          flash[:success] = "Project successfully Created!"
          redirect_to projects_path
        else
          redirect_to new_project_path
          flash[:alert] = @project.errors.full_messages
        end
    end

    def show
      @project = Project.find(params[:id])
    end

    def edit
      @project = Project.find(params[:id])
    end

    def update
      @project = Project.find(params[:id])
      if @project.update(project_params)
        redirect_to @project, notice: "Project was successfully updated."
      else
        redirect_to edit_project_path(@project)
        flash[:alert] = @project.errors.full_messages
      end
    end

    def destroy
      @project = Project.find(params[:id])
      @project.destroy
      respond_to do |format|
        format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private

    def project_params
        params.require(:project).permit(:name, :description)
    end
end
