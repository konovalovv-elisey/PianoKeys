//
//  ViewController.swift
//  PianoKeys
//
//  Created by Елисей Коновалов on 22.12.22..
//

import SnapKit
import UIKit

class MainViewController: UIViewController {
    
    var delegate: ViewControllerDelegate?
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.bounces = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var doButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "whiteButton"), for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(pushDoButton), for: .touchDown)
        button.addTarget(self, action: #selector(releasedDoButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var reButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "whiteButton"), for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(pushReButton), for: .touchDown)
        button.addTarget(self, action: #selector(releasedReButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var miButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "whiteButton"), for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(pushMiButton), for: .touchDown)
        button.addTarget(self, action: #selector(releasedMiButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var faButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "whiteButton"), for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(pushFaButton), for: .touchDown)
        button.addTarget(self, action: #selector(releasedFaButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var solButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "whiteButton"), for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(pushSolButton), for: .touchDown)
        button.addTarget(self, action: #selector(releasedSolButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var lyaButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "whiteButton"), for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(pushLyaButton), for: .touchDown)
        button.addTarget(self, action: #selector(releasedLyaButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var siButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "whiteButton"), for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(pushSiButton), for: .touchDown)
        button.addTarget(self, action: #selector(releasedSiButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var doDiesButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "blackButton"), for: .normal)
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(pushDoDiesButton), for: .touchDown)
        button.addTarget(self, action: #selector(releasedDoDiesButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var reDiesButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "blackButton"), for: .normal)
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(pushReDiesButton), for: .touchDown)
        button.addTarget(self, action: #selector(releasedReDiesButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var faDiesButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "blackButton"), for: .normal)
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(pushFaDiesButton), for: .touchDown)
        button.addTarget(self, action: #selector(releasedFaDiesButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var solDiesButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "blackButton"), for: .normal)
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(pushSolDiesButton), for: .touchDown)
        button.addTarget(self, action: #selector(releasedSolDiesButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var lyaDiesButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "blackButton"), for: .normal)
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(pushLyaDiesButton), for: .touchDown)
        button.addTarget(self, action: #selector(releasedLyaDiesButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)
        setupViews()
        setConstrints()
        self.delegate = LoggingViewControllerDelegate()
        scrollView.enableZoom()
    }
    
    @objc func pushDoButton() {
        delegate?.didButtonPresed(vc: self, buttonName: "Do")
    }
    @objc func releasedDoButton() {
        delegate?.didButtonReleased(vc: self, buttonName: "Do")
    }
    @objc func pushReButton() {
        delegate?.didButtonPresed(vc: self, buttonName: "Re")
    }
    @objc func releasedReButton() {
        delegate?.didButtonReleased(vc: self, buttonName: "Re")
    }
    @objc func pushMiButton() {
        delegate?.didButtonPresed(vc: self, buttonName: "Mi")
    }
    @objc func releasedMiButton() {
        delegate?.didButtonReleased(vc: self, buttonName: "Mi")
    }
    @objc func pushFaButton() {
        delegate?.didButtonPresed(vc: self, buttonName: "Fa")
    }
    @objc func releasedFaButton() {
        delegate?.didButtonReleased(vc: self, buttonName: "Fa")
    }
    @objc func pushSolButton() {
        delegate?.didButtonPresed(vc: self, buttonName: "Sol")
    }
    @objc func releasedSolButton() {
        delegate?.didButtonReleased(vc: self, buttonName: "Sol")
    }
    @objc func pushLyaButton() {
        delegate?.didButtonPresed(vc: self, buttonName: "Lya")
    }
    @objc func releasedLyaButton() {
        delegate?.didButtonReleased(vc: self, buttonName: "Lya")
    }
    @objc func pushSiButton() {
        delegate?.didButtonPresed(vc: self, buttonName: "Si")
    }
    @objc func releasedSiButton() {
        delegate?.didButtonReleased(vc: self, buttonName: "Si")
    }
    @objc func pushDoDiesButton() {
        delegate?.didButtonPresed(vc: self, buttonName: "Do dies")
    }
    @objc func releasedDoDiesButton() {
        delegate?.didButtonReleased(vc: self, buttonName: "Do dies")
    }
    @objc func pushReDiesButton() {
        delegate?.didButtonPresed(vc: self, buttonName: "Re dies")
    }
    @objc func releasedReDiesButton() {
        delegate?.didButtonReleased(vc: self, buttonName: "Re dies")
    }
    @objc func pushFaDiesButton() {
        delegate?.didButtonPresed(vc: self, buttonName: "Fa dies")
    }
    @objc func releasedFaDiesButton() {
        delegate?.didButtonReleased(vc: self, buttonName: "Fa dies")
    }
    @objc func pushSolDiesButton() {
        delegate?.didButtonPresed(vc: self, buttonName: "Sol dies")
    }
    @objc func releasedSolDiesButton() {
        delegate?.didButtonReleased(vc: self, buttonName: "Sol dies")
    }
    @objc func pushLyaDiesButton() {
        delegate?.didButtonPresed(vc: self, buttonName: "Lya dies")
    }
    @objc func releasedLyaDiesButton() {
        delegate?.didButtonReleased(vc: self, buttonName: "Lya dies")
    }
    
    private func setupViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(doButton)
        scrollView.addSubview(reButton)
        scrollView.addSubview(miButton)
        scrollView.addSubview(faButton)
        scrollView.addSubview(solButton)
        scrollView.addSubview(lyaButton)
        scrollView.addSubview(siButton)
        scrollView.addSubview(doDiesButton)
        scrollView.addSubview(reDiesButton)
        scrollView.addSubview(faDiesButton)
        scrollView.addSubview(solDiesButton)
        scrollView.addSubview(lyaDiesButton)
    }
    // MARK: - setConstrints
    private func setConstrints() {
        scrollView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        doButton.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 50, height: 200))
            make.top.equalTo(scrollView.snp_topMargin).inset(40)
            make.leading.equalTo(scrollView.snp_leadingMargin).inset(20)
        }
        reButton.snp.makeConstraints { make in
            make.size.equalTo(doButton)
            make.top.equalTo(doButton)
            make.leading.equalTo(doButton.snp_trailingMargin).offset(9)
        }
        miButton.snp.makeConstraints { make in
            make.size.equalTo(doButton)
            make.top.equalTo(doButton)
            make.leading.equalTo(reButton.snp_trailingMargin).offset(9)
        }
        faButton.snp.makeConstraints { make in
            make.size.equalTo(doButton)
            make.top.equalTo(doButton)
            make.leading.equalTo(miButton.snp_trailingMargin).offset(9)
        }
        solButton.snp.makeConstraints { make in
            make.size.equalTo(doButton)
            make.top.equalTo(doButton)
            make.leading.equalTo(faButton.snp_trailingMargin).offset(9)
        }
        lyaButton.snp.makeConstraints { make in
            make.size.equalTo(doButton)
            make.top.equalTo(doButton)
            make.leading.equalTo(solButton.snp_trailingMargin).offset(9)
        }
        siButton.snp.makeConstraints { make in
            make.size.equalTo(doButton)
            make.top.equalTo(doButton)
            make.leading.equalTo(lyaButton.snp_trailingMargin).offset(9)
        }
        
        doDiesButton.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 30, height: 135))
            make.top.equalTo(doButton)
            make.leading.equalTo(doButton.snp_leadingMargin).offset(27)
        }
        reDiesButton.snp.makeConstraints { make in
            make.size.equalTo(doDiesButton)
            make.top.equalTo(doButton)
            make.leading.equalTo(reButton.snp_leadingMargin).offset(27)
        }
        faDiesButton.snp.makeConstraints { make in
            make.size.equalTo(doDiesButton)
            make.top.equalTo(doButton)
            make.leading.equalTo(faButton.snp_leadingMargin).offset(27)
        }
        solDiesButton.snp.makeConstraints { make in
            make.size.equalTo(doDiesButton)
            make.top.equalTo(doButton)
            make.leading.equalTo(solButton.snp_leadingMargin).offset(27)
        }
        lyaDiesButton.snp.makeConstraints { make in
            make.size.equalTo(doDiesButton)
            make.top.equalTo(doButton)
            make.leading.equalTo(lyaButton.snp_leadingMargin).offset(27)
        }
    }
}

extension UIScrollView {
    func enableZoom() {
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(startZooming(_:)))
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(pinchGesture)
    }
    
    @objc
    private func startZooming(_ sender: UIPinchGestureRecognizer) {
        let scaleResult = sender.view?.transform.scaledBy(x: sender.scale, y: sender.scale)
        guard let scale = scaleResult, scale.a > 1, scale.d > 1 else { return }
        sender.view?.transform = scale
        sender.scale = 1
    }
}
