//
//  File.swift
//  
//
//  Created by Jordan Wood on 12/10/23.
//

import Parse

/// Input Source to image using Parse
public class ParseSource: NSObject, InputSource {
    var file: PFFileObject
    var placeholder: UIImage?

    /// Initializes a new source with URL and optionally a placeholder
    /// - parameter url: a url to be loaded
    /// - parameter placeholder: a placeholder used before image is loaded
    public init(file: PFFileObject, placeholder: UIImage? = nil) {
        self.file = file
        self.placeholder = placeholder
        super.init()
    }

    @objc public func load(to imageView: UIImageView, with callback: @escaping (UIImage?) -> Void) {
        imageView.image = self.placeholder

        self.file.getDataInBackground {(data: Data?, _: Error?) in
            if let data = data, let image = UIImage(data: data) {
                imageView.image = image
                callback(image)
            } else {
                callback(nil)
            }
        }
    }
}
