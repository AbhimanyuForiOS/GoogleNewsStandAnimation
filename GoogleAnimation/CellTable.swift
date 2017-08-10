import UIKit

class CellTable: UITableViewCell {
    
    //MARK:- Properties
    
    var viewMain:UIView!
    var lblTitle:UILabel!
    var imgView:UIImageView!
    var line:UIView!
    var gap:CGFloat = SCREEN_WIDTH*0.035
    
    
    var top:NSLayoutConstraint? = NSLayoutConstraint()
    var leading:NSLayoutConstraint? = NSLayoutConstraint()
    var bottom:NSLayoutConstraint? = NSLayoutConstraint()
    var trailing:NSLayoutConstraint? = NSLayoutConstraint()
    
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.layoutIfNeeded()
        self.contentView.backgroundColor =  .clear
        
        viewMain                                            = UIView()
        viewMain.backgroundColor                            = .white
        viewMain.translatesAutoresizingMaskIntoConstraints  = false
        self.contentView.addSubview(viewMain)
        
        imgView                                             =  UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints   = false
        imgView.backgroundColor                             = .orange
        imgView.clipsToBounds                               = true
        imgView.layer.cornerRadius                          = SCREEN_WIDTH*0.03
        viewMain.addSubview(imgView)
        
        lblTitle                                            = UILabel()
        lblTitle.translatesAutoresizingMaskIntoConstraints  = false;
        lblTitle.backgroundColor                            = .clear
        lblTitle.font                                       = UIFont.systemFont(ofSize: SCREEN_WIDTH*0.043)
        lblTitle.textColor                                  = .black
        
        viewMain.addSubview(lblTitle)
        
        line                                            = UIView()
        line.backgroundColor                            = .darkGray
        line.translatesAutoresizingMaskIntoConstraints  = false
        viewMain.addSubview(line)
        
        self.contentView.layoutIfNeeded()
        

        
        self.top =   C.get(item: viewMain, attri: .top, relatedBy: .equal, toItem: self.contentView, attribute: .top, multiplier: 1.0, constant: 0, viewMain: self.contentView)
        self.leading =   C.get(item: viewMain, attri: .leading, relatedBy: .equal, toItem: self.contentView, attribute: .leading, multiplier: 1.0, constant: 0.0, viewMain: self.contentView)
        self.trailing =  C.get(item: viewMain, attri: .trailing, relatedBy: .equal, toItem: self.contentView, attribute: .trailing, multiplier: 1.0, constant: 0.0, viewMain: self.contentView)
        self.bottom =  C.get(item: viewMain, attri: .bottom, relatedBy: .equal, toItem: self.contentView, attribute: .bottom, multiplier: 1.0, constant: 0.0, viewMain: self.contentView)
        
        
        
        //set up image 
        C.set(item: imgView, attri: .leading, relatedBy: .equal, toItem: viewMain, attribute: .leading, multiplier: 1.0, constant: SCREEN_WIDTH*0.10, viewMain: self.contentView)
        C.set(item: imgView, attri: .trailing, relatedBy: .equal, toItem: viewMain, attribute: .trailing, multiplier: 1.0, constant: -SCREEN_WIDTH*0.10, viewMain: self.contentView)
        C.set(item: imgView, attri: .bottom, relatedBy: .equal, toItem: viewMain, attribute: .bottom, multiplier: 1.0, constant: -SCREEN_WIDTH*0.10, viewMain: self.contentView)
        C.set(item: imgView, attri: .top, relatedBy: .equal, toItem: viewMain, attribute: .top, multiplier: 1.0, constant:  SCREEN_WIDTH*0.10, viewMain: self.contentView)
        
        imgView.layoutIfNeeded()
        
        
        
        
        C.set(item: lblTitle, attri: .leading, relatedBy: .equal, toItem: imgView, attribute: .leading, multiplier: 1.0, constant: 0, viewMain: self.contentView)
        C.set(item: lblTitle, attri: .trailing, relatedBy: .equal, toItem: imgView, attribute: .trailing, multiplier: 1.0, constant: 0, viewMain: self.contentView)
        C.set(item: lblTitle, attri: .bottom, relatedBy: .equal, toItem: viewMain, attribute: .bottom, multiplier: 1.0, constant: 0, viewMain: self.contentView)
        C.set(item: lblTitle, attri: .top, relatedBy: .equal, toItem: imgView, attribute: .bottom, multiplier: 1.0, constant: 0, viewMain: self.contentView)
        
        lblTitle.text = "Testing animation of row";
    
        lblTitle.layoutIfNeeded()
        
        
        
        
        
        
        C.set(item: line, attri: .leading, relatedBy: .equal, toItem: viewMain, attribute: .leading, multiplier: 1.0, constant: 0.0, viewMain: self.contentView)
        C.set(item: line, attri: .trailing, relatedBy: .equal, toItem: viewMain, attribute: .trailing, multiplier: 1.0, constant: 0.0, viewMain: self.contentView)
        C.set(item: line, attri: .bottom, relatedBy: .equal, toItem: viewMain, attribute: .bottom, multiplier: 1.0, constant: 0, viewMain: self.contentView)
        C.set(item: line, attri: .height, relatedBy: .equal, multiplier: 1.0, constant: 1.0, viewMain: self.contentView)
     
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
 
    
}
