class VideoTutorial < Product
  validates :description, :tagline, presence: true

  def teachers
    Teacher.joins(:video).merge(videos)
  end

  def collection?
    published_videos.count > 1
  end

  def included_in_plan?(plan)
    plan.has_feature?(:video_tutorials)
  end
end
