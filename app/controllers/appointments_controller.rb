class AppointmentsController < ApplicationController
  def index
      @appointments = Appointment.order('appt_time ASC')
      @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.create(appointment_params)
    @appointments = Appointment.order('appt_time ASC')
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy
    @appointments = Appointment.order('appt_time ASC')
    redirect_to :back
  end

  private
  def appointment_params
    params.require(:appointment).permit(:title, :appt_time)
  end
end
