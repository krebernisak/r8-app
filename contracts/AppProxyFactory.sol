pragma solidity ^0.4.23;

import "@aragon/os/contracts/lib/misc/ERCProxy.sol";
import "./R8App.sol";


contract AppProxyFactory {

  /**
   * @dev This event will be emitted every time a new proxy is created
   * @param _proxy representing the address of the proxy created
   */
  event NewAppProxy(address _proxy, bool _isUpgradeable);

  /**
   * @dev Creates an upgradeable proxy
   * @param _version representing the first version to be set for the proxy
   * @return address of the new proxy created
   */
  function create(bytes32 _version, address _implementation, bytes _contentURI) public payable returns (ERCProxy);
  
  function _init(ERCProxy _proxy, bool _isUpgradeable) internal {
    R8App(_proxy).initialize.value(msg.value)(msg.sender);
    emit NewAppProxy(address(_proxy), _isUpgradeable);
  }

}
