import Foundation
/*
 Global queues - this are system provided concurrent queue
 It has diffrenet quality of service - QOS
 - system proved
 - concurrent in nature - (but does not use main thread)
 - priority of this queues is decieded by quality of services - QOS
 
 These are written by priority
 Quality of Services - (QOS)
 1. UserInteractive - This is used for animations for any kind of user related job to be done that involves updating UI for task that interact with user and require immediate results (eg UI updated)
 2. UserInitated
 3. Utility
 4. Background
 5. Default
 6. Unspecfied
 */

// simpliest syntax for concurrent queue
DispatchQueue.global().async {
    for i in 0..<10 {
        print(i)
    }
}

// pass in paramater for QOS
DispatchQueue.global(qos: .userInitiated).async {
    print("Task getting executed in utility queue in background")
}



// 1. UserInteractive
DispatchQueue.global(qos: .userInteractive).async {
    print("Ant UI animations or user UI update related job should go here")
}

// ex: function to play background music seamlsly
DispatchQueue.global(qos: .userInteractive).async {
    // load and play the music file using AVFoundation framework
    print("logic for music playing")
    
    // UI logic still goes in main thread
    DispatchQueue.main.async {
        print("Update UI elements related to music playback. play/pause button updates")
    }
    
}

// 2. UserInitated - A tasks when user needs immediate results, eg- scrolling a list of data, pagination, pull to refrsh
DispatchQueue.global(qos: .userInitiated).async {
    print("Fetching data from server")
    
    DispatchQueue.main.async {
        print("Update UI elements related to fetched data. reload tableview/collectionview")
    }
}

// 3. Utility - Long Running task eg downloading a file,document,song which user is aware of this task and are not high prirotity
// can be used for API callss
DispatchQueue.global(qos: .utility).async {
    print("Downloading a file from server") // or api call
    DispatchQueue.main.async {
        print("Showing popup to user that download is complete")
    }
}

// 5. Default - this one fall in between userInitiated and Uitility priority
DispatchQueue.global(qos: .default).async {
    print("Default priority")
}

//6 Background - something that is not visible to user e.g creating backups, restoring data from server, syncing ur local data to sever ( any task which users shouldnt be aware of it
DispatchQueue.global(qos: .background).async {
    print("whatsapp creating backups")
}

// 6. Unspecfied - this are the task which are good to have functionality, least priority
DispatchQueue.global(qos: .unspecified).async {
    
}




