class Ad < ActiveRecord::Base
  
  #enum status
  enum status: [:active, :processing, :sold]

  # classificacao servico
  ratyrate_rateable 'quality'

  #callback
  before_save :md_to_html



  #assosiations
  belongs_to :member
  belongs_to :category
  has_many :comments


  #validates
  validates :title, :description, :category, :finish_date, presence: true

  validates :price, numericality: { greater_than: 0}

  #gem money-rails
  monetize :price_cents

  #scopes
  scope :descending_order, ->(page) {order(created_at: :desc).page(page).per(6)}
  scope :to_the, ->(member) {where(member: member)}
  scope :where_category, ->(id, page=1) {where(category: id).page(page).per(6)}
  scope :search, ->(q, page) {where("title LIKE ?", "%#{q}%").page(page).per(6)}



  #paperclip

  has_attached_file :picture, styles: {large: "800x300#", medium: "320x150#", thumb: "100x100>"}, default_url: "images/:style/missing.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/

  def avg_rating_dimension(ad)
    array = Rate.where(rateable_id: id, rateable_type: 'Ad').where(dimension: "quality")
    stars = array.map {|ad| ad.stars }
    star_count = stars.count
    stars_total = stars.inject(0){|sum,x| sum + x }
    score = stars_total / (star_count.nonzero? || 1)
  end

  private 
  def md_to_html
      options = {
        filter_html: true,
        link_attributes: {
          rel: "nofollow",
          target: "_blank"
        }
    }

    extensions = {
      space_after_headers: true,
      autolink: true
    }

    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)

    /self.description = markdown.render(self.description_md)/
  end

  

  
end
