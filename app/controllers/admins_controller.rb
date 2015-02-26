class AdminsController < ApplicationController

  def index
    if(!current_admin)
      return
    end

    @results = Hash.new

    @grant_submissions = GrantSubmission.where(grant_id: [1,2]) #lace and temple only for now

    @grant_submissions.each do |gs|

      votes = Vote.where("grant_submission_id = ?",gs.id)

      t_sum = 0
      t_num = 0;
      c_sum = 0;
      c_num = 0;
      f_sum = 0;
      f_num = 0;

      votes.each do |gsv|
        if(gsv.score_t)
          t_sum = t_sum+gsv.score_t
          t_num = t_num+1
        end

        if(gsv.score_c)
          c_sum = c_sum+gsv.score_c
          c_num = c_num+1
        end

        if(gsv.score_f)
          f_sum = f_sum+gsv.score_f
          f_num = f_num+1
        end

      end

      @results[gs.id] = Hash.new

      @results[gs.id]['num_t'] = t_num
      @results[gs.id]['sum_t'] = t_sum

      if(t_num > 0)
        @results[gs.id]['avg_t'] = t_sum.fdiv(t_num).round(2)
      end

      @results[gs.id]['num_c'] = c_num
      @results[gs.id]['sum_c'] = c_sum

      if(c_num > 0)
        @results[gs.id]['avg_c'] = c_sum.fdiv(c_num).round(2)
      end

      @results[gs.id]['num_f'] = f_num
      @results[gs.id]['sum_f'] = f_sum

      if(f_num > 0)
        @results[gs.id]['avg_f'] = f_sum.fdiv(f_num).round(2)
      end

      #@votes[gs.id] = vote

    end


  end
end
