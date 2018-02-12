//
//  Reusable+MKMapView.swift
//  ExFoundation
//
//  Created by 林達也 on 2018/02/12.
//  Copyright © 2018年 林達也. All rights reserved.
//

import MapKit

@available(iOS 11.0, *)
public extension MKMapView {
    func register(_ types: (MKAnnotationView & Reusable).Type...) {
        for type in types {
            register(type, forAnnotationViewWithReuseIdentifier: type.reusableIdentifier)
        }
    }
}

public extension MKMapView {
    func dequeueReusableAnnotationView<View>() -> View? where View: MKAnnotationView & Reusable {
        // swiftlint:disable:next force_cast
        return dequeueReusableAnnotationView(withIdentifier: View.reusableIdentifier) as! View?
    }

    @available(iOS 11.0, *)
    func dequeueReusableAnnotationView<View>(for annotation: MKAnnotation) -> View where View: MKAnnotationView & Reusable {
          // swiftlint:disable:next force_cast
        return dequeueReusableAnnotationView(withIdentifier: View.reusableIdentifier, for: annotation) as! View
    }
}
