//
//  TrailerViewController.swift
//  TrailerFlix
//
//  Created by Lucas Santana Brito on 02/11/19.
//  Copyright © 2019 lsb.br. All rights reserved.
//

import UIKit
import AVKit

class TrailerViewController: UIViewController {
    
    @IBOutlet weak var trailerImageView: UIImageView!
    @IBOutlet weak var nameTrailerLabel: UILabel!
    @IBOutlet weak var yearTrailerLabel: UILabel!
    @IBOutlet weak var ratingTrailerLabel: UILabel!
    @IBOutlet weak var trailerView: UIView!
    
    var trailer: Trailer!
    var player: AVPlayer!
    var playerController: AVPlayerViewController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
        preparePlayer()
    }
    
    func prepareView() {
        nameTrailerLabel.text = trailer.title
        yearTrailerLabel.text = "\(trailer.year)"
        ratingTrailerLabel.text = prepareRating()
        trailerImageView.image = UIImage(named: trailer.poster + "-large")
    }
    
    func prepareRating() -> String {
        var rating = "Ainda não avaliado"
        if trailer.rating > 0 {
            rating = ""
            for _ in 1...trailer.rating {
                rating += "✭"
            }
        }
        return rating
    }
    
    func preparePlayer() {
        let url = URL(fileURLWithPath: trailer.url)
        player = AVPlayer(url: url)
        playerController = AVPlayerViewController()
        playerController.player = player
        playerController.showsPlaybackControls = true
        playerController.player?.play()
        playerController.view.frame = trailerView.bounds
        trailerView.addSubview(playerController.view)
    }

    @IBAction func close(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
