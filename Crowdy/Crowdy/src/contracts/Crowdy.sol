//Updated Solidity Version from 0.5.0 and 0.8.0
pragma solidity ^0.8.0;

//Define Contract and Variable Videos
contract Crowdy {
  uint public videoCount = 0;
  string public name = "Crowdy";
  mapping(uint => Video) public videos;

  // Create Needed Data Types
  struct Video {
    uint id;
    string hash;
    string title;
    address author;
  }

  //Create an Event
  event VideoUploaded(
    uint id,
    string hash,
    string title,
    address author
  );

  constructor() public {
  }

  function uploadVideo(string memory _videoHash, string memory _title) public {
    // Make sure the video hash exists
    require(bytes(_videoHash).length > 0);
    // Make sure video title exists
    require(bytes(_title).length > 0);
    // Make sure uploader address exists
    require(msg.sender!=address(0));

    // Increment video id
    videoCount ++;

    // Add video to the contract
    videos[videoCount] = Video(videoCount, _videoHash, _title, msg.sender);
    // Trigger an event
    emit VideoUploaded(videoCount, _videoHash, _title, msg.sender);
  }
}
