class AdminsController < ApplicationController


  def assign
    if(!current_admin)
      return
    end

    # a terrible terrible thing :(

    #delete current assignments
    VoterSubmissionAssignment.destroy_all

    #undercooked copypasta w/ no sauce

    @verified_voters = Voter.where("verified = 1")
    vv_arr = @verified_voters.to_ary
    idx = 0
    max = vv_arr.size
    per = 3

    @sv = Hash.new

    @submissions = GrantSubmission.where(grant_id: [3,4]) #creativity and legacy only

    @submissions.each do |s|
      @sv[s.id] = Hash.new

      @sv[s.id]['id'] = s.id
      @sv[s.id]['name'] = s.name
      @sv[s.id]['assigned'] = Array.new(per)

      for i in 0..per-1
        @sv[s.id]['assigned'][i] = vv_arr[idx].id

        vsa = VoterSubmissionAssignment.new
        vsa.voter = vv_arr[idx].id
        vsa.grant_submission = s.id
        vsa.save

        idx=idx+1

        if idx >= max
          idx = 0
        end

      end

    end

    redirect_to action: "index"

  end


  def index
    if(!current_admin)
      return
    end


    # verified voters


    @verified_voters = Voter.where("verified = 1")
    vv_arr = @verified_voters.to_ary
    idx = 0
    max = vv_arr.size
    per = 3

    @sv = Hash.new

    @submissions = GrantSubmission.where(grant_id: [3,4]) #creativity and legacy only

    @submissions.each do |s|
      @sv[s.id] = Hash.new

      @sv[s.id]['id'] = s.id
      @sv[s.id]['name'] = s.name
      @sv[s.id]['assigned'] = Array.new(per)

      for i in 0..per-1
        @sv[s.id]['assigned'][i] = vv_arr[idx].id

        idx=idx+1

        if idx >= max
          idx = 0
        end

      end

    end



    # results

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

      if(@results[gs.id]['avg_t'] && @results[gs.id]['avg_c'] && @results[gs.id]['avg_f'])
        @results[gs.id]['avg_s'] = ((@results[gs.id]['avg_t'] + @results[gs.id]['avg_c'] + @results[gs.id]['avg_f'])/3.0).round(2)
      end

    end


  end
end
