//
//  GithubRepoItemTableViewCell.swift
//  GithubAwesomeRepos
//
//  Created by Ghadeer El-Mahdy on 23/11/2021.
//

import UIKit

class GithubRepoItemTableViewCell: UITableViewCell {

    @IBOutlet private weak var cellImage: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subtitleLabel: UILabel!
    @IBOutlet private weak var detailsLabel: UILabel!
    @IBOutlet weak var parentView: UIView!
    
    var cellViewModel: DataListCellViewModel?  {
        didSet {
            setupData(cellViewModel)
        }
    }
    private var isCellLoading = false
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setupData( _ cellViewModel: DataListCellViewModel?) {
        cellImage.loadImageUsingCache(withUrl: cellViewModel?.imageURL ?? "")
        titleLabel.text = cellViewModel?.titleText
        subtitleLabel.text = cellViewModel?.subTitleText
        detailsLabel.text = cellViewModel?.extraDetails ?? nil
        loadModelDetailsIfNeeded()
    }
    private func setupUI () {
        let colorPalette = DesignSystem.shared.choosedColorPalette
        titleLabel.textColor = colorPalette.headTextColor
        subtitleLabel.textColor = colorPalette.titleTextColor
        detailsLabel.textColor = colorPalette.smallTextColor
        self.parentView.backgroundColor = colorPalette.basicBackgroundColor
    }
    func setupDetails (requiredDetails: String?) {
        detailsLabel.text = requiredDetails
        cellViewModel?.extraDetails = requiredDetails
        isCellLoading = false
    }
    private func loadModelDetailsIfNeeded () {
        if let url = cellViewModel?.detailsURL, cellViewModel?.extraDetails == nil , !self.isCellLoading {
            isCellLoading = true
            self.loadDataUsingCache(withUrl: url)
        }
    }
    
}
fileprivate let cellCache = NSCache<NSString, NSString>()
extension GithubRepoItemTableViewCell {
    func loadDataUsingCache(withUrl urlString : String) {
        // check cached image
        if let cachedObject = cellCache.object(forKey: urlString as NSString) as String?  {
            self.setupDetails(requiredDetails: cachedObject)
            return
        }
        
        let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView(style: .medium)
        addSubview(activityIndicator)
        activityIndicator.startAnimating()
        activityIndicator.center = self.center
        
        // if not, download image from url
        fetchRepoURL(repoURL: urlString) {[weak self] res in
            DispatchQueue.main.async {
                activityIndicator.removeFromSuperview()
            switch res {
            case .success(let repo):
                if let repo = repo {
                    self?.setupDetails(requiredDetails: repo.createdAt?.getFormattedDate())
                   
                }
            case .failure(let error):
                print(error.localizedDescription)
                self?.setupDetails(requiredDetails: nil)
            }
          }
        }
    }
    private func fetchRepoURL (repoURL:String, completion: @escaping ResponseHandler<GithubRepoModel?>) {
        NetworkManager.shared.performNetworRequest(urlStr: repoURL, completion: completion)
    }
}
